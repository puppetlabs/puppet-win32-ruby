# -*- encoding: utf-8 -*-
# stub: win32-security 0.2.5 ruby lib

Gem::Specification.new do |s|
  s.name = "win32-security".freeze
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel J. Berger".freeze, "Park Heesob".freeze]
  s.date = "2014-02-25"
  s.description = "    The win32-security library provides an interface for dealing with\n    security related aspects of MS Windows. At the moment it provides an\n    interface for inspecting or creating SID's.\n".freeze
  s.email = "djberg96@gmail.com".freeze
  s.extra_rdoc_files = ["README".freeze, "CHANGES".freeze, "MANIFEST".freeze]
  s.files = ["CHANGES".freeze, "MANIFEST".freeze, "README".freeze]
  s.homepage = "https://github.com/djberg96/win32-security".freeze
  s.licenses = ["Artistic 2.0".freeze]
  s.rubyforge_project = "win32utils".freeze
  s.rubygems_version = "2.6.11".freeze
  s.summary = "A library for dealing with aspects of Windows security.".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 2.5.0"])
      s.add_development_dependency(%q<sys-admin>.freeze, [">= 1.6.0"])
    else
      s.add_dependency(%q<ffi>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 2.5.0"])
      s.add_dependency(%q<sys-admin>.freeze, [">= 1.6.0"])
    end
  else
    s.add_dependency(%q<ffi>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 2.5.0"])
    s.add_dependency(%q<sys-admin>.freeze, [">= 1.6.0"])
  end
end
