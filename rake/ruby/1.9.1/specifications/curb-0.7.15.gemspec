# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{curb}
  s.version = "0.7.15"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Ross Bamford}, %q{Todd A. Fisher}]
  s.date = %q{2011-03-20}
  s.description = %q{Curb (probably CUrl-RuBy or something) provides Ruby-language bindings for the libcurl(3), a fully-featured client-side URL transfer library. cURL and libcurl live at http://curl.haxx.se/}
  s.email = %q{todd.fisher@gmail.com}
  s.extensions = [%q{ext/extconf.rb}]
  s.extra_rdoc_files = [%q{LICENSE}, %q{README}]
  s.files = [%q{LICENSE}, %q{README}, %q{ext/extconf.rb}]
  s.homepage = %q{http://curb.rubyforge.org/}
  s.rdoc_options = [%q{--main}, %q{README}]
  s.require_paths = [%q{lib}, %q{ext}]
  s.rubyforge_project = %q{curb}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Ruby libcurl bindings}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
