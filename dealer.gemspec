# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dealer/version'

Gem::Specification.new do |spec|
  spec.name = "dealer"
  spec.version = Dealer::VERSION
  spec.authors = ["Andrew McCloud"]
  spec.email = ["andrew@amccloud.com"]
  spec.summary = %q{Ruby library for ranking poker hands.}
  spec.homepage = "https://github.com/amccloud/dealer"
  spec.license = "MIT"
  spec.files = `git ls-files`.split($/)
  spec.test_files = Dir.glob("test/**/*_test.rb").sort
  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
