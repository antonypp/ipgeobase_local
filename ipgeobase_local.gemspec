# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ipgeobase_local/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Anton Taraev"]
  gem.email         = ["anti191@gmail.com"]
  gem.description   = %q{geo ip}
  gem.summary       = %q{geo ip}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ipgeobase_local"
  gem.require_paths = ["lib"]
  gem.version       = IpgeobaseLocal::VERSION

end
