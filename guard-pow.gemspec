# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/pow/version'

Gem::Specification.new do |s|
  s.name         = "guard-pow"
  s.version      = Guard::PowVersion::VERSION
  s.author       = "Thibaud Guillaume-Gentil"
  s.email        = "thibaud@thibaud.me"
  s.summary      = 'Guard plugin for Pow'
  s.description  = 'Guard::Pow automatically manage Pow applications restart'
  s.homepage     = 'http://rubygems.org/gems/guard-pow'
  s.license      = "MIT"

  s.files        = `git ls-files`.split($/)
  s.test_files   = s.files.grep(%r{^spec/})
  s.require_path = 'lib'

  s.add_dependency 'guard', '~> 2.0'
  s.add_development_dependency 'bundler', '>= 1.3.5'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
