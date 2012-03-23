# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "handsak/version"

Gem::Specification.new do |s|
  s.name        = "handsak"
  s.version     = Handsak::VERSION
  s.authors     = ["Mpowered"]
  s.email       = ["mpowered.development@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Small ruby utils/extensions}
  s.description = %q{Small ruby utils/extensions}

  s.rubyforge_project = "handsak"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
