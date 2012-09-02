# coding: UTF-8
namespace :ipgeobase_local do

  desc "Update base file form ipgeobase.ru"
  task :update => :environment do
    require 'net/http'
    dir = "#{IpgeobaseLocal.base_directory}"
    if dir.blank?
      raise "Not set base directory"
    end
    uri = URI('http://ipgeobase.ru/files/db/Main/geo_files.tar.gz')
    file_name = uri.path.split('/').last
    file_name = [dir, file_name].join

    FileUtils.mkdir_p "#{dir}"

    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new uri.request_uri
      http.request request do |response|
        open file_name, 'wb' do |io|
          response.read_body do |chunk|
            io.write chunk
          end
        end
      end
    end

    system("tar -xzf #{file_name} -C #{dir}")
    FileUtils.rm file_name
  end
end
