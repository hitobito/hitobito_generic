# encoding: utf-8

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your wagon's version:
require 'hitobito_generic/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  # rubocop:disable SingleSpaceBeforeFirstArg
  s.name        = 'hitobito_generic'
  s.version     = HitobitoGeneric::VERSION
  s.authors     = ['Pascal Zumkehr']
  s.email       = ['zumkehr@puzzle.ch']
  s.homepage    = 'http://hitobito.ch'
  s.summary     = 'Generic wagon for hitobito'
  s.description = 'Generic wagon for hitobito'

  s.files       = Dir['{app,config,db,lib}/**/*'] + ['Rakefile']
  s.test_files  = Dir['{test,spec}/**/*']
  # rubocop:enable SingleSpaceBeforeFirstArg
end
