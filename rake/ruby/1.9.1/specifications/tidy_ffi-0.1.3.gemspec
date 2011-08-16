# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tidy_ffi}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Eugene Pimenov}]
  s.date = %q{2010-06-12}
  s.description = %q{Tidy library interface via FFI}
  s.email = %q{libc@libc.st}
  s.extra_rdoc_files = [%q{CHANGELOG}, %q{LICENSE}, %q{README.rdoc}, %q{lib/tidy_ffi/interface.rb}, %q{lib/tidy_ffi/lib_tidy.rb}, %q{lib/tidy_ffi/options_container.rb}, %q{lib/tidy_ffi/tidy.rb}, %q{lib/tidy_ffi/tidy_ffi_extensions.rb}, %q{lib/tidy_ffi.rb}]
  s.files = [%q{CHANGELOG}, %q{LICENSE}, %q{README.rdoc}, %q{lib/tidy_ffi/interface.rb}, %q{lib/tidy_ffi/lib_tidy.rb}, %q{lib/tidy_ffi/options_container.rb}, %q{lib/tidy_ffi/tidy.rb}, %q{lib/tidy_ffi/tidy_ffi_extensions.rb}, %q{lib/tidy_ffi.rb}]
  s.homepage = %q{http://github.com/libc/tidy_ffi}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Tidy_ffi}, %q{--main}, %q{README.rdoc}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{tidy-ffi}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Tidy library interface via FFI}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>, [">= 0.3.5"])
    else
      s.add_dependency(%q<ffi>, [">= 0.3.5"])
    end
  else
    s.add_dependency(%q<ffi>, [">= 0.3.5"])
  end
end
