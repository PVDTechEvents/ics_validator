# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ics_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "ics_validator"
  spec.version       = IcsValidator::VERSION
  spec.authors       = ["Matt Gillooly"]
  spec.email         = ["matt@swipely.com"]
  spec.description   = %q{Validate iCalendar content}
  spec.summary       = %q{Validate iCalendar content}
  spec.homepage      = "http://github.com/mattgillooly/ics_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cane"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
