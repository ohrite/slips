require 'rack-livereload'

use Rack::Logger
use Rack::LiveReload
run Rack::Directory.new('_site')