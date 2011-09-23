# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{POpen4}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{John-Mason P. Shackelford}]
  s.date = %q{2009-11-17}
  s.description = %q{}
  s.email = %q{john-mason@shackelford.org}
  s.extra_rdoc_files = [%q{LICENSE}, %q{README.rdoc}]
  s.files = [%q{LICENSE}, %q{README.rdoc}]
  s.homepage = %q{http://github.com/pka/popen4}
  s.rdoc_options = [%q{--charset=UTF-8}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Open4 cross-platform}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<Platform>, [">= 0.4.0"])
      s.add_runtime_dependency(%q<open4>, [">= 0"])
    else
      s.add_dependency(%q<Platform>, [">= 0.4.0"])
      s.add_dependency(%q<open4>, [">= 0"])
    end
  else
    s.add_dependency(%q<Platform>, [">= 0.4.0"])
    s.add_dependency(%q<open4>, [">= 0"])
  end
end
