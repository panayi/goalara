# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jammit}
  s.version = "0.6.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Jeremy Ashkenas}]
  s.date = %q{2011-05-26}
  s.description = %q{    Jammit is an industrial strength asset packaging library for Rails,
    providing both the CSS and JavaScript concatenation and compression that
    you'd expect, as well as YUI Compressor and Closure Compiler compatibility,
    ahead-of-time gzipping, built-in JavaScript template support, and optional
    Data-URI / MHTML image embedding.
}
  s.email = %q{jeremy@documentcloud.org}
  s.executables = [%q{jammit}]
  s.extra_rdoc_files = [%q{README}]
  s.files = [%q{bin/jammit}, %q{README}]
  s.homepage = %q{http://documentcloud.github.com/jammit/}
  s.rdoc_options = [%q{--title}, %q{Jammit}, %q{--exclude}, %q{test}, %q{--main}, %q{README}, %q{--all}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{jammit}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Industrial Strength Asset Packaging for Rails}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<yui-compressor>, [">= 0.9.3"])
    else
      s.add_dependency(%q<yui-compressor>, [">= 0.9.3"])
    end
  else
    s.add_dependency(%q<yui-compressor>, [">= 0.9.3"])
  end
end
