# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "win32-api"
  s.version = "1.5.1"
  s.platform = "x64-mingw32"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel J. Berger", "Park Heesob"]
  s.date = "2014-06-13"
  s.description = "    The Win32::API library is meant as a replacement for the Win32API\n    library that ships as part of the standard library. It contains several\n    advantages over Win32API, including callback support, raw function\n    pointers, an additional string type, and more.\n"
  s.email = "djberg96@gmail.com"
  s.extra_rdoc_files = ["README", "CHANGES", "MANIFEST", "ext/win32/api.c"]
  s.files = ["README", "CHANGES", "MANIFEST", "ext/win32/api.c"]
  s.homepage = "http://github.com/djberg96/win32-api"
  s.licenses = ["Artistic 2.0"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.2")
  s.rubyforge_project = "win32utils"
  s.rubygems_version = "2.0.14"
  s.summary = "A superior replacement for Win32API"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<test-unit>, [">= 2.5.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<test-unit>, [">= 2.5.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<test-unit>, [">= 2.5.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
