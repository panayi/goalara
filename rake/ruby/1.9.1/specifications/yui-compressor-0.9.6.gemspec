# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yui-compressor}
  s.version = "0.9.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Sam Stephenson}]
  s.date = %q{2011-03-30}
  s.description = %q{A Ruby interface to YUI Compressor for minifying JavaScript and CSS assets.}
  s.email = %q{sstephenson@gmail.com}
  s.homepage = %q{http://github.com/sstephenson/ruby-yui-compressor/}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{yui}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{JavaScript and CSS minification library}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<POpen4>, [">= 0.1.4"])
    else
      s.add_dependency(%q<POpen4>, [">= 0.1.4"])
    end
  else
    s.add_dependency(%q<POpen4>, [">= 0.1.4"])
  end
end
