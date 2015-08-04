# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ks_parking_payment/version'

Gem::Specification.new do |spec|
  spec.name          = "ks_parking_payment"
  spec.version       = KsParkingPayment::VERSION
  spec.authors       = ["Jimmy"]
  spec.email         = ["jimmy.lin@gmail.com"]
  spec.summary       = %q{kaohsiung parking payment}
  spec.description   = %q{kaohsiung parking payment}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = %w[ks_parking_payment]
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  #spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
