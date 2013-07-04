# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'operation/great/justice/version'

Gem::Specification.new do |spec|
  spec.name          = "operation-great-justice"
  spec.version       = Operation::Great::Justice::VERSION
  spec.authors       = ["James Harton"]
  spec.email         = ["jamesotron@gmail.com"]
  spec.description   = %q{Deterministically generate a code name from a string token}
  spec.summary       = %q{Deterministically generate a code name from a string token}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = %w[ ogj ]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
