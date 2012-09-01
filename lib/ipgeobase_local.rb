module IpgeobaseLocal
  autoload 'Version', "ipgeobase_local/version"
  autoload 'Ext', "ipgeobase_local/ext"
  autoload 'IpMetaData', 'ipgeobase_local/ip_meta_data'

  def self.lookup(ip)
    IpMetaData.parse(ip)
  end

  ip_meta = lookup('127.0.0.1')
  puts ip_meta.inspect
end
