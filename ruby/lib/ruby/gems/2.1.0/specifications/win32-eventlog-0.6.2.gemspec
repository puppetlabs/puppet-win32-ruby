# -*- encoding: utf-8 -*-
# stub: win32-eventlog 0.6.2 ruby lib

Gem::Specification.new do |s|
  s.name = "win32-eventlog"
  s.version = "0.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Daniel J. Berger", "Park Heesob"]
  s.date = "2014-10-06"
  s.description = "    The win32-eventlog library provides an interface to the MS Windows event\n    log. Event logging provides a standard, centralized way for applications\n    (and the operating system) to record important software and hardware\n    events. The event-logging service stores events from various sources in a\n    single collection called an event log. This library allows you to inspect\n    existing logs as well as create new ones.\n"
  s.email = "djberg96@gmail.com"
  s.extra_rdoc_files = ["README", "CHANGES", "MANIFEST", "doc/tutorial.txt"]
  s.files = ["CHANGES", "MANIFEST", "README", "doc/tutorial.txt"]
  s.homepage = "http://github.com/djberg96/win32-eventlog"
  s.licenses = ["Artistic 2.0"]
  s.rubyforge_project = "win32utils"
  s.rubygems_version = "2.2.2"
  s.summary = "Interface for the MS Windows Event Log."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<ptools>, [">= 0"])
    else
      s.add_dependency(%q<ffi>, [">= 0"])
      s.add_dependency(%q<test-unit>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<ptools>, [">= 0"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0"])
    s.add_dependency(%q<test-unit>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<ptools>, [">= 0"])
  end
end