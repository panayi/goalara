# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fastimage}
  s.version = "1.2.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Stephen Sykes}]
  s.date = %q{2010-11-11}
  s.description = %q{FastImage finds the size or type of an image given its uri by fetching as little as needed.}
  s.email = %q{sdsykes@gmail.com}
  s.extra_rdoc_files = [%q{README}, %q{README.textile}]
  s.files = [%q{README}, %q{README.textile}]
  s.homepage = %q{http://github.com/sdsykes/fastimage}
  s.rdoc_options = [%q{--charset=UTF-8}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{FastImage - Image info fast}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
