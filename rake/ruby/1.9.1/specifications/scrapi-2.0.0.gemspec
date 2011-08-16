# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{scrapi}
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Assaf Arkin}]
  s.autorequire = %q{scrapi.rb}
  s.date = %q{2010-11-10}
  s.description = %q{scrAPI is an HTML scraping toolkit for Ruby. It uses CSS selectors to write easy, maintainable scraping rules to select, extract and store data from HTML content.
}
  s.email = %q{assaf@labnotes.org}
  s.extra_rdoc_files = [%q{README.rdoc}]
  s.files = [%q{README.rdoc}]
  s.homepage = %q{http://github.com/assaf/scrapi}
  s.rdoc_options = [%q{--main}, %q{README.rdoc}, %q{--title}, %q{scrAPI toolkit for Ruby}, %q{--line-numbers}]
  s.require_paths = [%q{lib}]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.1")
  s.requirements = [%q{Tidy_ffi}]
  s.rubyforge_project = %q{scrapi}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{scrAPI toolkit for Ruby. Uses CSS selectors to write easy, maintainable HTML scraping rules.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<tidy_ffi>, [">= 0.1.2"])
    else
      s.add_dependency(%q<tidy_ffi>, [">= 0.1.2"])
    end
  else
    s.add_dependency(%q<tidy_ffi>, [">= 0.1.2"])
  end
end
