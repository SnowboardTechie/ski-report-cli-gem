# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ski_report/version'

Gem::Specification.new do |spec|
  spec.name          = "ski-report-cli-gem"
  spec.version       = SkiReport::VERSION
  spec.authors       = ["SnowboardTechie"]
  spec.email         = ["bryan.thompson518@gmail.com"]

  spec.summary       = "Uses data from OnTheSnow.com to provide snow reports"
  
  spec.homepage      = "https://github.com/SnowboardTechie/ski-report-cli-gem"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  
  spec.executables   = ["ski-report"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0"

  spec.add_runtime_dependency "nokogiri", "~> 1.6"
  
end
