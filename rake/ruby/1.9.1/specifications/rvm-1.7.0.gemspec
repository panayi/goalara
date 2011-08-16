# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rvm}
  s.version = "1.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Wayne E. Seguin}]
  s.date = %q{2011-08-15}
  s.description = %q{RVM is the Ruby enVironment Manager (rvm).
It manages Ruby application environments and switching between them.}
  s.email = [%q{wayneeseguin@gmail.com}]
  s.extra_rdoc_files = [%q{History.txt}, %q{Manifest.txt}]
  s.files = [%q{History.txt}, %q{Manifest.txt}]
  s.homepage = %q{http://github.com/wayneeseguin/rvm}
  s.post_install_message = %q{********************************************************************************

  This gem contains only the Ruby libraries for the RVM Ruby API.

  In order to install RVM please use one of the methods listed in the
  documentation:

    https://rvm.beginrescueend.com/rvm/install/

  such as,

    bash < <(curl -s -B https://rvm.beginrescueend.com/install/rvm)

  followed by placing the sourcing line in your ~/.bash_profile or wherever may
  be appropriate for your setup (example, .zshenv, /etc/profile, ...):

    # Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

  After completing setup please open a new shell to use RVM and be sure to run
  'rvm notes' to gain a list of dependencies to install before installing the
  first Ruby. You can read more details about this process on the above
  mentioned install page as well as the basics page:

    https://rvm.beginrescueend.com/rvm/basics/

  Enjoy!

      ~Wayne

********************************************************************************
}
  s.rdoc_options = [%q{--main}, %q{README.txt}, %q{--inline-source}, %q{--charset=UTF-8}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{rvm}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{RVM is the Ruby enVironment Manager (rvm)}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, ["~> 2.10"])
    else
      s.add_dependency(%q<hoe>, ["~> 2.10"])
    end
  else
    s.add_dependency(%q<hoe>, ["~> 2.10"])
  end
end
