require 'iconv' unless String.new.respond_to?(:encode)

module IpgeobaseLocal
  class IpMetaData

    def initialize(country='', region='', city='')
      @country = country
      @region = region
      @city = city
    end

    def city;@city;end
    def country;@country;end
    def region;@region;end

  end
end
