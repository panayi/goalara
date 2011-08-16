# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rake-remote_task}
  s.version = "2.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Ryan Davis}, %q{Eric Hodel}, %q{Wilson Bilkovich}]
  s.cert_chain = [%q{-----BEGIN CERTIFICATE-----
MIIDPjCCAiagAwIBAgIBADANBgkqhkiG9w0BAQUFADBFMRMwEQYDVQQDDApyeWFu
ZC1ydWJ5MRkwFwYKCZImiZPyLGQBGRYJemVuc3BpZGVyMRMwEQYKCZImiZPyLGQB
GRYDY29tMB4XDTA5MDMwNjE4NTMxNVoXDTEwMDMwNjE4NTMxNVowRTETMBEGA1UE
AwwKcnlhbmQtcnVieTEZMBcGCgmSJomT8ixkARkWCXplbnNwaWRlcjETMBEGCgmS
JomT8ixkARkWA2NvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALda
b9DCgK+627gPJkB6XfjZ1itoOQvpqH1EXScSaba9/S2VF22VYQbXU1xQXL/WzCkx
taCPaLmfYIaFcHHCSY4hYDJijRQkLxPeB3xbOfzfLoBDbjvx5JxgJxUjmGa7xhcT
oOvjtt5P8+GSK9zLzxQP0gVLS/D0FmoE44XuDr3iQkVS2ujU5zZL84mMNqNB1znh
GiadM9GHRaDiaxuX0cIUBj19T01mVE2iymf9I6bEsiayK/n6QujtyCbTWsAS9Rqt
qhtV7HJxNKuPj/JFH0D2cswvzznE/a5FOYO68g+YCuFi5L8wZuuM8zzdwjrWHqSV
gBEfoTEGr7Zii72cx+sCAwEAAaM5MDcwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAw
HQYDVR0OBBYEFEfFe9md/r/tj/Wmwpy+MI8d9k/hMA0GCSqGSIb3DQEBBQUAA4IB
AQAY59gYvDxqSqgC92nAP9P8dnGgfZgLxP237xS6XxFGJSghdz/nI6pusfCWKM8m
vzjjH2wUMSSf3tNudQ3rCGLf2epkcU13/rguI88wO6MrE0wi4ZqLQX+eZQFskJb/
w6x9W1ur8eR01s397LSMexySDBrJOh34cm2AlfKr/jokKCTwcM0OvVZnAutaovC0
l1SVZ0ecg88bsWHA0Yhh7NFxK1utWoIhtB6AFC/+trM0FQEB/jZkIS8SaNzn96Rl
n0sZEf77FLf5peR8TP/PtmIg7Cyqz23sLM4mCOoTGIy5OcZ8TdyiyINUHtb5ej/T
FBHgymkyj/AOSqKRIpXPhjC6
-----END CERTIFICATE-----
}]
  s.date = %q{2011-06-23}
  s.description = %q{Vlad the Deployer's sexy brainchild is rake-remote_task, extending
Rake with remote task goodness.}
  s.email = [%q{ryand-ruby@zenspider.com}, %q{drbrain@segment7.net}, %q{wilson@supremetyrant.com}]
  s.extra_rdoc_files = [%q{History.txt}, %q{Manifest.txt}, %q{README.txt}]
  s.files = [%q{History.txt}, %q{Manifest.txt}, %q{README.txt}]
  s.homepage = %q{http://rubyhitsquad.com/}
  s.rdoc_options = [%q{--main}, %q{README.txt}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{hitsquad}
  s.rubygems_version = %q{1.8.7}
  s.summary = %q{Vlad the Deployer's sexy brainchild is rake-remote_task, extending Rake with remote task goodness.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, ["~> 0.8"])
      s.add_runtime_dependency(%q<open4>, ["~> 0.9.0"])
      s.add_development_dependency(%q<minitest>, [">= 2.3.1"])
      s.add_development_dependency(%q<hoe>, ["~> 2.9"])
    else
      s.add_dependency(%q<rake>, ["~> 0.8"])
      s.add_dependency(%q<open4>, ["~> 0.9.0"])
      s.add_dependency(%q<minitest>, [">= 2.3.1"])
      s.add_dependency(%q<hoe>, ["~> 2.9"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 0.8"])
    s.add_dependency(%q<open4>, ["~> 0.9.0"])
    s.add_dependency(%q<minitest>, [">= 2.3.1"])
    s.add_dependency(%q<hoe>, ["~> 2.9"])
  end
end
