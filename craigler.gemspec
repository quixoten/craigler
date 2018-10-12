# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'craigler/version'

Gem::Specification.new do |gem|
  gem.name          = "craigler"
  gem.version       = Craigler::VERSION
  gem.authors       = ["Devin Christensen"]
  gem.email         = ["quixoten@gmail.com"]
  gem.summary       = %Q{Search API for craigslist}
  gem.homepage      = "http://github.com/illogician/craigler"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "hpricot", "~> 0.8"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "shoulda"
  gem.add_development_dependency "minitest"
  gem.add_development_dependency "test-unit"
  gem.add_development_dependency "yard"
end

