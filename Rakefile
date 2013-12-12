#!/usr/bin/env rake

ENGINE_PATH = File.expand_path('..', __FILE__)
require File.expand_path('../app_root', __FILE__)

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end


load 'wagons/wagon_tasks.rake'

load 'rspec/rails/tasks/rspec.rake'

require 'ci/reporter/rake/rspec' unless Rails.env == 'production'

HitobitoGeneric::Wagon.load_tasks

task 'test:prepare' => 'db:test:prepare'
