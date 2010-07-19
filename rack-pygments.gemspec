
Gem::Specification.new do |s|
  s.specification_version     = 1 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.name        = 'rack-pygments'
  s.version     = 0.2
  s.description = "rack-pygments - Rack Middleware for Pygments, the syntax highlighter"
  s.summary     = "rack-pygments"

  s.authors = ['Bryan Goines']
  s.email = 'bryan@ffiirree.com'

  s.files      = ["lib/rack/pygments/version.rb", "lib/rack/pygments.rb", "examples/sinatra", "examples/sinatra/public", "examples/sinatra/public/style.css", "examples/sinatra/app.rb", "examples/sinatra/config.ru", "LICENSE"]
  s.test_files = ["spec/lib/rack/pygments_spec.rb", "spec/spec.opts", "spec/spec_helper.rb"]

  s.executables = []
  s.extra_rdoc_files = %w[README]
  s.has_rdoc = false
  s.homepage = "http://github.com/bry4n/rack-pygments"
  s.require_paths = %w[lib]
  s.rubyforge_project = 'rack-pygments'
  s.rubygems_version = '1.3.1'
  s.add_dependency("rack")
  s.add_dependency("nokogiri")
  s.add_development_dependency("rspec")
  s.platform = Gem::Platform::RUBY
end
