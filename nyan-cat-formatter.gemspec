$:.push File.expand_path("../lib", __FILE__)
require 'smooth_jazz_nyan_cat_formatter/version'

Gem::Specification.new do |s|
  s.name        = "smooth-jazz-nyan-cat-formatter"
  s.version     = SmoothJazzNyanCatFormatter::VERSION
  s.authors     = ["Ryan Spore"]
  s.email       = ["ry@nspore.com"]
  s.summary     = %q{Nyan Cat inspired RSpec formatter! Now with more Jazz! }
  s.description = %q{Nyan Cat inspired RSpec formatter! Now with more Jazz! }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rspec-instafail"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
end
