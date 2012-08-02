# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard-ctags"

Gem::Specification.new do |s|
  s.name        = "guard-ctags"
  s.version     = Guard::Ctags::VERSION
  s.authors     = ["Łukasz Korecki"]
  s.email       = ["lukasz@coffeesounds.com"]
  s.homepage    = ""
  s.summary     = %q{guard plugin for generating ctags}
  s.description = %q{guard-ctags allows to specify which tag generator needs to be used for generating tags file for a given file type. This way one can use regular excuberant-ctags for ruby, jsctags for javascript and CoffeeTags for CoffeeScript}

  s.rubyforge_project = "guard-ctags"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_runtime_dependency "guard"
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard-rspec"
end
