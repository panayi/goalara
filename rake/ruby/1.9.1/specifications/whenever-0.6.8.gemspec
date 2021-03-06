# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{whenever}
  s.version = "0.6.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Javan Makhmali}]
  s.date = %q{2011-05-24}
  s.description = %q{Clean ruby syntax for writing and deploying cron jobs.}
  s.email = [%q{javan@javan.us}]
  s.executables = [%q{whenever}, %q{wheneverize}]
  s.files = [%q{bin/whenever}, %q{bin/wheneverize}]
  s.homepage = %q{}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Cron jobs in ruby.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<aaronh-chronic>, [">= 0.3.9"])
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.4"])
      s.add_development_dependency(%q<shoulda>, [">= 2.1.1"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.5"])
    else
      s.add_dependency(%q<aaronh-chronic>, [">= 0.3.9"])
      s.add_dependency(%q<activesupport>, [">= 2.3.4"])
      s.add_dependency(%q<shoulda>, [">= 2.1.1"])
      s.add_dependency(%q<mocha>, [">= 0.9.5"])
    end
  else
    s.add_dependency(%q<aaronh-chronic>, [">= 0.3.9"])
    s.add_dependency(%q<activesupport>, [">= 2.3.4"])
    s.add_dependency(%q<shoulda>, [">= 2.1.1"])
    s.add_dependency(%q<mocha>, [">= 0.9.5"])
  end
end
