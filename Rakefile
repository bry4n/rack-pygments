require 'rubygems'
require 'spec/rake/spectask'
require File.expand_path(File.dirname(__FILE__) + '/lib/rack/pygments/version')

desc "Run all specs in spec directory"
Spec::Rake::SpecTask.new(:spec)

task :default => :spec

namespace :gem do
  desc "Build the gem"
  task :build do
    sh "erb rack-pygments.gemspec.erb > rack-pygments.gemspec"
    sh "gem build rack-pygments.gemspec"
  end

  desc "Install the gem"
  task :install do
    sh "gem install rack-pygments-#{Rack::Pygments::Version::STRING}.gem"
  end
end

desc "Pushing gem to RubyGems.org"
task :push do
  sh "gem push rack-pygments-#{Rack::Pygments::Version::STRING}.gem"
end
