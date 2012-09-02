module IpgeobaseLocal
  autoload 'Version', "ipgeobase_local/version"
  autoload 'IpMetaData', 'ipgeobase_local/ip_meta_data'
  autoload 'MemoryBase', 'ipgeobase_local/memory_base'
  require 'ipgeobase_local/rails_config' if defined?(Rails)

  class << self
    attr_accessor :base_directory
  end

  def self.lookup(ip)
    MemoryBase.parse(ip)
  end
  def self.load
    MemoryBase.load unless defined?(Rake)
  end
end
