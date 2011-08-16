# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{loofah}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Mike Dalessio}, %q{Bryan Helmkamp}]
  s.date = %q{2010-10-26}
  s.description = %q{Loofah is a general library for manipulating and transforming HTML/XML
documents and fragments. It's built on top of Nokogiri and libxml2, so
it's fast and has a nice API.

Loofah excels at HTML sanitization (XSS prevention). It includes some
nice HTML sanitizers, which are based on HTML5lib's whitelist, so it
most likely won't make your codes less secure. (These statements have
not been evaluated by Netexperts.)

ActiveRecord extensions for sanitization are available in the
`loofah-activerecord` gem (see
http://github.com/flavorjones/loofah-activerecord).}
  s.email = [%q{mike.dalessio@gmail.com}, %q{bryan@brynary.com}]
  s.extra_rdoc_files = [%q{MIT-LICENSE.txt}, %q{Manifest.txt}, %q{CHANGELOG.rdoc}, %q{README.rdoc}]
  s.files = [%q{MIT-LICENSE.txt}, %q{Manifest.txt}, %q{CHANGELOG.rdoc}, %q{README.rdoc}]
  s.homepage = %q{http://github.com/flavorjones/loofah}
  s.rdoc_options = [%q{--main}, %q{README.rdoc}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{loofah}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Loofah is a general library for manipulating and transforming HTML/XML documents and fragments}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.3.3"])
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<mocha>, [">= 0.9"])
      s.add_development_dependency(%q<shoulda>, [">= 2.10"])
      s.add_development_dependency(%q<rake>, [">= 0.8"])
      s.add_development_dependency(%q<hoe>, [">= 2.6.1"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.3.3"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<mocha>, [">= 0.9"])
      s.add_dependency(%q<shoulda>, [">= 2.10"])
      s.add_dependency(%q<rake>, [">= 0.8"])
      s.add_dependency(%q<hoe>, [">= 2.6.1"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.3.3"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<mocha>, [">= 0.9"])
    s.add_dependency(%q<shoulda>, [">= 2.10"])
    s.add_dependency(%q<rake>, [">= 0.8"])
    s.add_dependency(%q<hoe>, [">= 2.6.1"])
  end
end
