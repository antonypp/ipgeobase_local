require 'iconv' unless String.new.respond_to?(:encode)
require 'ipaddr'

module IpgeobaseLocal
  class IpMetaData

    def self.parse(ip)
      new(ip)
    end

    def initialize(ip)
      extend IpgeobaseLocal::Ext
      @country, @region, @city = internal_lookup(check_ip(ip))
    end

    def city;encode(@city);end
    def country;encode(@country);end
    def region;encode(@region);end

    private

    def check_ip(ip)
      if ::IPAddr.new(ip).ipv4?
        ip
      end
    end

    def encode(api_string)
      if api_string.respond_to?(:encode)
        api_string.encode
      else
        Iconv.iconv('windows-1251', 'utf-8', api_string).first
      end
    end
  end
end
