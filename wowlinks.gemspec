# -*- encoding: utf-8 -*-
require File.expand_path('../lib/wowlinks/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['dusknoir']
  gem.email         = ['me@dusknoir.net']
  gem.description   = 'undefined'
  gem.summary       = gem.description

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(/^bin\//).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(/^(test|spec|features)\//)
  gem.name          = 'wowlinks'
  gem.require_paths = ['lib']
  gem.version       = Wowlinks::VERSION

  gem.add_development_dependency 'rspec'

end
