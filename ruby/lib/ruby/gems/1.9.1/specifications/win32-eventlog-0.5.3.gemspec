# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "win32-eventlog"
  s.version = "0.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel J. Berger", "Park Heesob"]
  s.date = "2011-10-26"
  s.description = "    The win32-eventlog library provides an interface to the MS Windows event\n    log. Event logging provides a standard, centralized way for applications\n    (and the operating system) to record important software and hardware\n    events. The event-logging service stores events from various sources in a\n    single collection called an event log. This library allows you to inspect\n    existing logs as well as create new ones.\n"
  s.email = "djberg96@gmail.com"
  s.extra_rdoc_files = ["README", "CHANGES", "MANIFEST", "doc/tutorial.txt"]
  s.files = ["README", "CHANGES", "MANIFEST", "doc/tutorial.txt"]
  s.homepage = "http://www.rubyforge.org/projects/win32utils"
  s.licenses = ["Artistic 2.0"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "win32utils"
  s.rubygems_version = "1.8.12"
  s.summary = "Interface for the MS Windows Event Log."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<windows-pr>, [">= 0.9.3"])
      s.add_development_dependency(%q<ptools>, [">= 1.1.6"])
      s.add_development_dependency(%q<test-unit>, [">= 2.1.1"])
    else
      s.add_dependency(%q<windows-pr>, [">= 0.9.3"])
      s.add_dependency(%q<ptools>, [">= 1.1.6"])
      s.add_dependency(%q<test-unit>, [">= 2.1.1"])
    end
  else
    s.add_dependency(%q<windows-pr>, [">= 0.9.3"])
    s.add_dependency(%q<ptools>, [">= 1.1.6"])
    s.add_dependency(%q<test-unit>, [">= 2.1.1"])
  end
end
