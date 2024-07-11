$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your wagon's version:
require "hitobito_generic/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  # rubocop:disable Style/SingleSpaceBeforeFirstArg
  s.name = "hitobito_generic"
  s.version = HitobitoGeneric::VERSION
  s.authors = ["Pascal Zumkehr"]
  s.email = ["zumkehr@puzzle.ch"]
  s.homepage = "http://hitobito.ch"
  s.summary = "Generic wagon for hitobito"
  s.description = "Generic wagon for hitobito"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile"]
  # rubocop:enable Style/SingleSpaceBeforeFirstArg
end
