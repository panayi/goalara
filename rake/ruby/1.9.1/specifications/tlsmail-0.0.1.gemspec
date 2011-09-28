# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tlsmail}
  s.version = "0.0.1"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = [%q{zorio}]
  s.cert_chain = nil
  s.date = %q{2007-03-17}
  s.description = %q{This library enables pop or smtp via ssl/tls by dynamically replacing these classes to these in ruby 1.9.}
  s.email = %q{zoriorz@gmail.com}
  s.homepage = %q{http://tlsmail.rubyforge.org}
  s.require_paths = [%q{lib}]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{tlsmail}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{This library enables pop or smtp via ssl/tls by dynamically replacing these classes to these in ruby 1.9.}

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
