# frozen_string_literal: true
require "rubygems"
require "bundler/setup"
require 'bundler/gem_tasks'
require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
RSpec::Core::RakeTask.new(:appraisal)

if !ENV["APPRAISAL_INITIALIZED"] && !ENV["TRAVIS"]
  task :default => :appraisal
else
  task default: :spec
end
