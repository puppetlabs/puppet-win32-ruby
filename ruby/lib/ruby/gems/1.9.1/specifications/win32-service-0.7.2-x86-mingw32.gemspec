# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "win32-service"
  s.version = "0.7.2"
  s.platform = "x86-mingw32"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel J. Berger", "Park Heesob"]
  s.date = "2011-09-07"
  s.description = "    The win32-service library provides a Ruby interface to services on\n    MS Windows. You can create new services, or control, configure and\n    inspect existing services.\n\n    In addition, you can create a pure Ruby service by using the Daemon\n    class that is included as part of the library.\n"
  s.email = "djberg96@gmail.com"
  s.extra_rdoc_files = ["CHANGES", "README", "MANIFEST", "doc/service.txt", "doc/daemon.txt", "ext/win32/daemon.c"]
  s.files = ["CHANGES", "README", "MANIFEST", "doc/service.txt", "doc/daemon.txt", "ext/win32/daemon.c"]
  s.homepage = "http://www.rubyforge.org/projects/win32utils"
  s.licenses = ["Artistic 2.0"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.2")
  s.rubyforge_project = "win32utils"
  s.rubygems_version = "1.8.12"
  s.summary = "An interface for MS Windows services"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<windows-pr>, [">= 1.0.8"])
      s.add_development_dependency(%q<test-unit>, [">= 2.1.0"])
    else
      s.add_dependency(%q<windows-pr>, [">= 1.0.8"])
      s.add_dependency(%q<test-unit>, [">= 2.1.0"])
    end
  else
    s.add_dependency(%q<windows-pr>, [">= 1.0.8"])
    s.add_dependency(%q<test-unit>, [">= 2.1.0"])
  end
end
