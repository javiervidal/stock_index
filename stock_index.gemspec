# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stock_index/version'

Gem::Specification.new do |spec|
  spec.name          = "stock_index"
  spec.version       = StockIndex::VERSION
  spec.authors       = ["Javier Vidal"]
  spec.email         = ["javier@javiervidal.net"]
  spec.summary       = 'Stock Index'
  spec.description   = 'Stock Index'
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end
