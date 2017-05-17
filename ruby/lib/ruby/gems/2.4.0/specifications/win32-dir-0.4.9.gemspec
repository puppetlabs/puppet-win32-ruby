# -*- encoding: utf-8 -*-
# stub: win32-dir 0.4.9 ruby lib

Gem::Specification.new do |s|
  s.name = "win32-dir".freeze
  s.version = "0.4.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel J. Berger".freeze, "Park Heesob".freeze]
  s.date = "2014-07-02"
  s.description = "    The win32-dir library provides extra methods and constants for the\n    builtin Dir class. The constants provide a convenient way to identify\n    certain directories across all versions of Windows. Some methods have\n    been added, such as the ability to create junctions. Others have been\n    modified to provide a more consistent result for MS Windows.\n".freeze
  s.email = "djberg96@gmail.com".freeze
  s.extra_rdoc_files = ["README".freeze, "CHANGES".freeze, "MANIFEST".freeze]
  s.files = ["CHANGES".freeze, "MANIFEST".freeze, "README".freeze]
  s.homepage = "http://github.com/djberg96/win32-dir".freeze
  s.licenses = ["Artistic 2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2".freeze)
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Extra constants and methods for the Dir class on Windows.".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>.freeze, [">= 1.0.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<test-unit>.freeze, [">= 2.4.0"])
    else
      s.add_dependency(%q<ffi>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<test-unit>.freeze, [">= 2.4.0"])
    end
  else
    s.add_dependency(%q<ffi>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 2.4.0"])
  end
end
