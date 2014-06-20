# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sys-admin"
  s.version = "1.6.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel J. Berger"]
  s.date = "2014-03-08"
  s.description = "    The sys-admin library is a unified, cross platform replacement for the\n    'etc' library that ships as part of the Ruby standard library. It\n    provides a common interface for all platforms, including MS Windows. In\n    addition, it provides an interface for adding, deleting and configuring\n    users on MS Windows.\n"
  s.email = "djberg96@gmail.com"
  s.extra_rdoc_files = ["CHANGES", "README", "MANIFEST"]
  s.files = ["CHANGES", "README", "MANIFEST"]
  s.homepage = "http://www.github.com/djberg96/sysutils"
  s.licenses = ["Artistic 2.0"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "sysutils"
  s.rubygems_version = "2.0.14"
  s.summary = "A unified, cross platform replacement for the \"etc\" library."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 1.1.0"])
      s.add_development_dependency(%q<test-unit>, [">= 2.5.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<ffi>, [">= 1.1.0"])
      s.add_dependency(%q<test-unit>, [">= 2.5.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 1.1.0"])
    s.add_dependency(%q<test-unit>, [">= 2.5.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
