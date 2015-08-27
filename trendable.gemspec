# -*- encoding: utf-8 -*-
require File.expand_path('../lib/trendable/version', __FILE__)

Gem::Specification.new do |s|
  s.name = "trendable"
  s.version     = Trendable::Rails::VERSION
  s.platform    = Gem::Platform::RUBY

  s.authors = ["Jeff McFadden"]
  s.date = "2015-08-27"
  s.description = "Organize your models by a trending popularity value"
  s.email = "jeff@forgeapps.com"
  s.extra_rdoc_files = [
    "LICENSE.txt"
  ]
  s.files        = `git ls-files`.split("\n")

  s.homepage = "http://github.com/ForgeApps/trendable"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = Trendable::Rails::VERSION
  s.summary = "Organize your models by a trending popularity value"

  s.add_dependency "activesupport", ">= 4.1.0"
  s.add_dependency "sidekiq"
end