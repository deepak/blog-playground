#\ -w --host localhost --port 8000
# 'localhost' is the "loopback" or local-only interface. can only communicate within the same host

require "rack-nocache"
require 'rack-livereload'

use Rack::Nocache
use Rack::Static,
    urls: ['/css'],
    root: 'public'
use Rack::LiveReload

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html'
    },
    [File.read('public/index.html')]
  ]
}
