Gem::Specification.new do |s|
 s.specification_version = 1 if s.respond_to? :specification_version=
 s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
 
 s.name    	= 'rack-pygments'
 s.version	= '0.1'
 s.description	= "rack-pygments - Rack Middle for Pygments, the syntax highlighter"
 s.summary	= "rack-pygments"
 
 s.authors	= ['Bryan Goines']
 s.email	= 'bryan@ffiirree.com'
 
 s.files 	= ["lib/rack/pygments.rb", "examples/sinatra", "examples/sinatra/app.rb", "examples/sinatra/config.ru", "examples/sinatra/public", "examples/sinatra/public/style.css", "LICENSE"]

 s.executables = []
 s.extra_rdoc_files	= %w[README]
 s.has_rdoc = false
 s.homepage = "http://github.com/bry4n/rack-pygments"
 s.require_paths = %w[lib]
 s.rubyforge_project = 'rack-pygments'
 s.rubygems_version = '1.3.1'
 s.add_dependency("rack")
 s.platform = Gem::Platform::RUBY
end
