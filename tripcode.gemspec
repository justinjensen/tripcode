# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tripcode/version'

Gem::Specification.new do |spec|
  spec.name          = "tripcode"
  spec.version       = Tripcode::VERSION
  spec.authors       = ["Justin Jensen"]
  spec.email         = ["sqwwwd@gmail.com"]

  spec.summary       = "4chan tripcodes in ruby"
  spec.description   = "4chan compatible tripcodes implemented in ruby."
  spec.homepage      = "https://github.com/justinjensen/tripcode"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = "tripcode"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
