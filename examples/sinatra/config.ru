$: << "../../lib"

require "app"
require "rack/pygments"

use Rack::Pygments

run Sinatra::Application
