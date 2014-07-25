# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jekyll-date-format"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brandon Mathis"]
  s.date = "2013-08-16"
  s.description = "Automatically adds variables with nicely formated dates and time tags to Jekyll posts and pages."
  s.email = ["brandon@imathis.com"]
  s.homepage = "https://github.com/octopress/jekyll-date-format"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "Automatically adds variables with nicely formated dates and time tags to Jekyll posts and pages."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>, [">= 1.0.0"])
    else
      s.add_dependency(%q<jekyll>, [">= 1.0.0"])
    end
  else
    s.add_dependency(%q<jekyll>, [">= 1.0.0"])
  end
end
