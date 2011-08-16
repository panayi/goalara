# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{feedzirra}
  s.version = "0.0.24"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Paul Dix}]
  s.date = %q{2009-02-19}
  s.email = %q{paul@pauldix.net}
  s.homepage = %q{http://github.com/pauldix/feedzirra}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{A feed fetching and parsing library that treats the internet like Godzilla treats Japan: it dominates and eats all.}

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["> 0.0.0"])
      s.add_runtime_dependency(%q<sax-machine>, [">= 0.0.12"])
      s.add_runtime_dependency(%q<curb>, [">= 0.2.3"])
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.8"])
      s.add_runtime_dependency(%q<loofah>, [">= 0.3.1"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<diff-lcs>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, ["> 0.0.0"])
      s.add_dependency(%q<sax-machine>, [">= 0.0.12"])
      s.add_dependency(%q<curb>, [">= 0.2.3"])
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<activesupport>, [">= 2.3.8"])
      s.add_dependency(%q<loofah>, [">= 0.3.1"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<diff-lcs>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["> 0.0.0"])
    s.add_dependency(%q<sax-machine>, [">= 0.0.12"])
    s.add_dependency(%q<curb>, [">= 0.2.3"])
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<activesupport>, [">= 2.3.8"])
    s.add_dependency(%q<loofah>, [">= 0.3.1"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<diff-lcs>, [">= 0"])
  end
end
