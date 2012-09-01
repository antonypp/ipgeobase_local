#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "Load files"
task :load_ipgeobase do
  require 'net/http'
  dir = FileUtils.pwd
  uri = URI('http://ipgeobase.ru/files/db/Main/geo_files.tar.gz')
  file_name = uri.path.split('/').last
  file_name = [dir, "/", file_name].join
  Net::HTTP.start(uri.host, uri.port) do |http|
    request = Net::HTTP::Get.new uri.request_uri
    http.request request do |response|
      open file_name, 'w' do |io|
        response.read_body do |chunk|
          io.write chunk
        end
      end
    end
  end
  FileUtils.rm_rf "#{dir}/geofile"
  FileUtils.mkdir "#{dir}/geofile"
  system("tar -xzf #{file_name} -C #{dir}/geofile")
  FileUtils.rm file_name
end
