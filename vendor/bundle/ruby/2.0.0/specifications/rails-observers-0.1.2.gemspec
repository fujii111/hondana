# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rails-observers"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rafael Mendon\u{e7}a Fran\u{e7}a", "Steve Klabnik"]
  s.date = "2013-07-19"
  s.description = "Rails observer (removed from core in Rails 4.0)"
  s.email = ["rafaelmfranca@gmail.com", "steve@steveklabnik.com"]
  s.homepage = "https://github.com/rails/rails-observers"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.2"
  s.summary = "ActiveModel::Observer, ActiveRecord::Observer and ActionController::Caching::Sweeper extracted from Rails."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activemodel>, ["~> 4.0"])
      s.add_development_dependency(%q<minitest>, [">= 3"])
      s.add_development_dependency(%q<railties>, ["~> 4.0"])
      s.add_development_dependency(%q<activerecord>, ["~> 4.0"])
      s.add_development_dependency(%q<actionmailer>, ["~> 4.0"])
      s.add_development_dependency(%q<actionpack>, ["~> 4.0"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3"])
    else
      s.add_dependency(%q<activemodel>, ["~> 4.0"])
      s.add_dependency(%q<minitest>, [">= 3"])
      s.add_dependency(%q<railties>, ["~> 4.0"])
      s.add_dependency(%q<activerecord>, ["~> 4.0"])
      s.add_dependency(%q<actionmailer>, ["~> 4.0"])
      s.add_dependency(%q<actionpack>, ["~> 4.0"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3"])
    end
  else
    s.add_dependency(%q<activemodel>, ["~> 4.0"])
    s.add_dependency(%q<minitest>, [">= 3"])
    s.add_dependency(%q<railties>, ["~> 4.0"])
    s.add_dependency(%q<activerecord>, ["~> 4.0"])
    s.add_dependency(%q<actionmailer>, ["~> 4.0"])
    s.add_dependency(%q<actionpack>, ["~> 4.0"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3"])
  end
end
