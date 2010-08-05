# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{scrobbler-ng-utils}
  s.version = "2.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Uwe L. Korn"]
  s.date = %q{2010-07-31}
  s.description = %q{Utilities like caching, rate limiting, ... for usage in combination with the scrobbler gem. These will be not included in the main gem as they provide extra functionality that is not always required.}
  s.email = %q{uwelk@xhochy.org}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "lib/scrobbler-ng-utils.rb",
     "lib/scrobbler-ng-utils/cache/mongo.rb"
  ]
  s.homepage = %q{http://github.com/xhochy/scrobbler-ng-utils}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Utilities for usage in combination with the scrobbler-ng gem}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/scrobbler-ng-utils_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
