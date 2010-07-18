require 'rubygems'
require 'spec/rake/spectask'

desc "Run all specs in spec directory"
Spec::Rake::SpecTask.new(:spec)

task :default => :spec

desc "Building a gem"

task :build do
  sh "erb rack-pygments.gemspec.erb > rack-pygments.gemspec"
  sh "gem build rack-pygments.gemspec"
end

desc "Installing gem"
task :install do
  sh "sudo gem install rack-pygments-0.1.gem"
end

desc "Pushing gem to Gemcutter"
task :push do
  sh "gem push rack-pygments-0.1.gem"
end
