module IpgeobaseLocal
  autoload 'Version', "ipgeobase_local/version"
  autoload 'IpMetaData', 'ipgeobase_local/ip_meta_data'
  autoload 'MemoryBase', 'ipgeobase_local/memory_base'

  def self.lookup(ip)
    MemoryBase.parse(ip)
  end
end
