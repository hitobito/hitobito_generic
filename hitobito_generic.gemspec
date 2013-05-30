$:.push File.expand_path("../lib", __FILE__)

# Maintain your wagon's version:
require "hitobito_generic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hitobito_generic"
  s.version     = HitobitoGeneric::VERSION
  s.authors     = ["Pascal Zumkehr"]
  s.email       = ["zumkehr@puzzle.ch"]
  #s.homepage    = "TODO"
  s.summary     = "Generic wagon for hitobito"
  s.description = "Generic wagon for hitobito"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  s.test_files = Dir["test/**/*"]

end
