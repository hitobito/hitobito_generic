# encoding: utf-8

#  Copyright (c) 2012-2013, Puzzle ITC GmbH. This file is part of
#  hitobito_generic and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/hitobito/hitobito_generic.


def init_wagon
  init_app_helper
  config_rspec
end

def init_app_helper
  load File.expand_path('../../app_root.rb', __FILE__)
  ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

  require File.join(ENV["APP_ROOT"], 'spec', 'spec_helper.rb')

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[HitobitoGeneric::Wagon.root.join('spec/support/**/*.rb')].sort.each { |f| require f }
end

def config_rspec
  RSpec.configure do |config|
    config.fixture_path = File.expand_path("../fixtures", __FILE__)
  end
end


if /spork/i =~ $PROGRAM_NAME || (RSpec.respond_to?(:configuration) && RSpec.configuration.drb?)
  require 'spork'
  Spork.prefork { init_wagon }
  Spork.each_run {}
else
  init_wagon
end