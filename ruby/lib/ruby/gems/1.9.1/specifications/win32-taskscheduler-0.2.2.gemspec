# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "win32-taskscheduler"
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Park Heesob", "Daniel J. Berger"]
  s.date = "2012-02-29"
  s.description = "    The win32-taskscheduler library provides an interface to the MS Windows\n    Task Scheduler. With this interface you can create new scheduled tasks,\n    configure existing tasks, or delete tasks.\n"
  s.email = "djberg96@gmail.com"
  s.extra_rdoc_files = ["README", "CHANGES", "MANIFEST", "doc/taskscheduler.txt"]
  s.files = ["README", "CHANGES", "MANIFEST", "doc/taskscheduler.txt"]
  s.homepage = "http://www.rubyforge.org/projects/win32utils"
  s.licenses = ["Artistic 2.0"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "win32utils"
  s.rubygems_version = "1.8.16"
  s.summary = "A library for the Windows task scheduler"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
