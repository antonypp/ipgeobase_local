module IpgeobaseLocal
  class RailsConfig < Rails::Railtie

    rake_tasks do
      load "tasks/ipgeobase_local.rake"
    end

  end
end
