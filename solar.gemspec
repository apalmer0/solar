# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solar/version'

Gem::Specification.new do |spec|
  spec.name          = "solar"
  spec.version       = Solar::VERSION
  spec.authors       = ["Javier Goizueta"]
  spec.email         = ["jgoizueta@gmail.com"]

  spec.summary       = %q{Calculation of solar position.}
  spec.description   = %q{Methods to compute solar position. Extrapolated from jgoizueta/solar}
  spec.homepage      = "https://github.com/apalmer0/solar"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "gnar-style"
  spec.add_development_dependency "pronto-rubocop"
  spec.add_development_dependency "pronto"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-its"
end
