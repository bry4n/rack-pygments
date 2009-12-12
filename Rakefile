task :default => :test

desc "Running the test"
task :test do
 puts "This will be added soon. Run 'rake build install' to install gem"
end

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
