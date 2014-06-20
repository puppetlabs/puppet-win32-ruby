# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "structured_warnings"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gregor Schmidt"]
  s.date = "2013-04-26"
  s.description = "\n    This is an implementation of Daniel Berger's proposal of structured\n    warnings for Ruby.\n  "
  s.email = "ruby@schmidtwisser.de"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/schmidt/structured_warnings"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Provides structured warnings for Ruby, using an exception-like interface and hierarchy"
end
