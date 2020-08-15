# frozen_string_literal: true
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nameq/version'

Gem::Specification.new do |spec|
  spec.name          = "nameq"
  spec.version       = NameQ::VERSION
  spec.authors       = ["Kevin McDonald"]
  spec.email         = ["kevinstuffandthings@gmail.com"]
  spec.summary       = %q{Create unique names via numeric suffixes}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/kevinstuffandthings/nameq"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yard"
end
