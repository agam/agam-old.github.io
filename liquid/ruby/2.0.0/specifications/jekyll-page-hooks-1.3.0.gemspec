# -*- encoding: utf-8 -*-
# stub: jekyll-page-hooks 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-page-hooks"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brandon Mathis"]
  s.date = "2014-06-22"
  s.description = "Monkeypatches Jekyll's Site, Post, Page and Convertible classes to allow other plugins to access page/post content before and after render, and after write."
  s.email = ["brandon@imathis.com"]
  s.homepage = "http://github.com/octopress/jekyll-page-hooks"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.11"
  s.summary = "Allows other plugins to access page/post content before and after render, and after write."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>, [">= 2.0.0"])
    else
      s.add_dependency(%q<jekyll>, [">= 2.0.0"])
    end
  else
    s.add_dependency(%q<jekyll>, [">= 2.0.0"])
  end
end
