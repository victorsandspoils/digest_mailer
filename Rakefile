# -*- encoding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
desc 'Run the specs'
RSpec::Core::RakeTask.new do |r|
  r.verbose = true
end

task :default => :spec

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end


require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "digest_mailer"
  gem.homepage = "http://github.com/szehnder/digest_mailer"
  gem.license = "MIT"
  gem.summary = %Q{Provides a digest functionality for our app}
  gem.description = %Q{Provides a digest functionality for our application leveraging delayed_job and action_mailer}
  gem.email = "szehnder@victorsandspoils.com"
  gem.authors = ["Sean Zehnder"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new