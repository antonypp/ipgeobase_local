require 'singleton'
require 'ipaddr'
require 'csv'

module IpgeobaseLocal
  class MemoryBase
    include ::Singleton

    def self.parse(ip)
      instance.find(ip)
    end

    def initialize()
      load_base
    end

    def find(ip)
      ip = convert_ip(ip)
      binary_find(ip)
    end

    def binary_find(ip)
      max_index = @cidr_base.size - 1
      min_index = 0
      while min_index < max_index
        current_index = (min_index + max_index)/2
        current_index = current_index.round
        if ip < @cidr_base[current_index][:start]
          max_index = current_index
          next
        end
        if ip > @cidr_base[current_index][:end]
          min_index = current_index + 1
          next
        end
        if (@cidr_base[current_index][:start] <= ip)&&( ip <= @cidr_base[current_index][:end])
          return @cidr_base[current_index][:meta_data]
        end
      end
      false
    end

    private

    def load_base
      cidr_file = './geofile/cidr_optim.txt'
      cities_file = './geofile/cities.txt'
      city_base = {}
      @cidr_base = []
      CSV.foreach(cities_file, col_sep: "\t", quote_char:"'", encoding: "windows-1251:utf-8") do |line|
        city_base[line[0]] = line[1..5]
      end
      CSV.foreach(cidr_file, col_sep: "\t", quote_char:"'") do |line|
        region = ''
        city = ''
        country = line[3]
        unless line[4] == '-'
          city_info = city_base[line[4]]
          if city_info
            city = city_info[0]
            region = city_info[1]
          end
        end
        @cidr_base << {start: line[0].to_i, end: line[1].to_i, meta_data: IpMetaData.new(country, region, city)}
      end
    end

    def convert_ip(ip)
      if ::IPAddr.new(ip).ipv4?
        part = ip.split(".").map{|i| i.to_i}
        256**3*part[0]+256**2*part[1]+256*part[2]+part[3]
      end
    end
  end
end
