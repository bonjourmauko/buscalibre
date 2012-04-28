# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "buscalibre/version"

Gem::Specification.new do |s|
  s.name        = "buscalibre"
  s.version     = Buscalibre::VERSION
  s.authors     = ["Mauko Quiroga"]
  s.email       = ["mauko@acid.cl"]
  s.homepage    = "https://github.com/maukoquiroga/buscalibre"
  s.summary     = %q{Buscalibre.com's API Client}
  s.description = %q{Basic Ruby Wrapper to Buscalibre.com's API.}

  s.rubyforge_project = "buscalibre"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "activesupport"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-instafail"

  s.add_dependency "yajl-ruby"
  s.add_dependency "typhoeus"
  s.add_dependency "i18n"
end
