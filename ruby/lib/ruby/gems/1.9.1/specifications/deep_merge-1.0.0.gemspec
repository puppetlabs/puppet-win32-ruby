# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "deep_merge"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steve Midgley"]
  s.date = "2011-07-28"
  s.description = "Recursively merge hashes. Now works with Ruby 1.9 and ActiveSupport"
  s.email = "dan@kallistec.com"
  s.extra_rdoc_files = ["README"]
  s.files = ["README"]
  s.homepage = "http://github.com/danielsdeleo/deep_merge"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Merge Deeply Nested Hashes"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
