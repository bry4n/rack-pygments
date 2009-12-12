require "sinatra"

set :public, File.dirname(__FILE__) + "/public"
set :static, true

get "/" do
  erb :pygments
end

__END__

@@layout
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">

    <title>Rack::Pygments</title>
    <link rel="stylesheet" href="/style.css" type="text/css" media="screen">
  </head>
  <body>
    <%= yield %>    
  </body>
</html>

@@pygments

Bash
<highlight lang="bash">

sudo gem install rack-pygments -s http://gemcutter.org/ 

</highlight>

Ruby
<highlight lang="ruby">

def hello(arg)
  puts "Hello #{arg.capitalize}!"
end

</highlight>

Python

<highlight lang="python">

def hello(arg):
    print "Hello %s!" % arg

</highlight>
