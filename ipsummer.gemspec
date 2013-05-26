# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ipsummer/version'

Gem::Specification.new do |spec|
  spec.name          = "ipsummer"
  spec.version       = Ipsummer::VERSION
  spec.authors       = ["Taylor Kearns"]
  spec.email         = ["tkearns@gmail.com"]
  spec.description   = %q{Inject dynamic lorem ipsum directly into your markup with customized length and link options.}
  spec.summary       = %q{Dynamic, customized lorem ipsum.}
  spec.homepage      = "http://github.com/taylorkearns/ipsummer"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'actionpack'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
