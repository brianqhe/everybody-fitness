# -*- encoding: utf-8 -*-
# stub: solidus_support 0.8.1 ruby lib

Gem::Specification.new do |s|
  s.name = "solidus_support".freeze
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["John Hawthorn".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-01-27"
  s.email = "john@stembolt.com".freeze
  s.homepage = "https://github.com/solidusio/solidus_support".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.rubygems_version = "3.2.6".freeze
  s.summary = "Common runtime helpers for Solidus extensions.".freeze

  s.installed_by_version = "3.2.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<solidus_dev_support>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
    s.add_dependency(%q<solidus_dev_support>.freeze, [">= 0"])
  end
end
