# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{thumbs_up}
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Brady Bouchard}, %q{Peter Jackson}, %q{Cosmin Radoi}, %q{Bence Nagy}, %q{Rob Maddox}, %q{Wojciech WnÄtrzak}]
  s.date = %q{2011-04-03}
  s.description = %q{ThumbsUp provides dead-simple voting capabilities to ActiveRecord models with karma calculation, a la stackoverflow.com.}
  s.email = %q{brady@ldawn.com}
  s.extra_rdoc_files = [%q{README.markdown}]
  s.files = [%q{README.markdown}]
  s.homepage = %q{http://github.com/brady8/thumbs_up}
  s.rdoc_options = [%q{--charset=UTF-8}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Voting for ActiveRecord with multiple vote sources and karma calculation.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
