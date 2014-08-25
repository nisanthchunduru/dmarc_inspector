# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dmarc_inspector/version'

Gem::Specification.new do |spec|
  spec.name          = "dmarc_inspector"
  spec.version       = DMARCInspector::VERSION
  spec.authors       = ["Nisanth Chunduru"]
  spec.email         = ["nisanth074@gmail.com"]
  spec.summary       = "Looks up DMARC policy of a domain"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'parslet', '~> 1.6'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency 'rspec-core', '~> 3.0'
  spec.add_development_dependency 'rspec-expectations', '~> 3.0'
  spec.add_development_dependency 'rspec-mocks', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency "rake", "~> 10.0"
end
