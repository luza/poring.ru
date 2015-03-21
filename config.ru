# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
use Rack::Deflater
if Rails.env.test?
  use Rack::RubyProf, :path => 'tmp/profile'
end
run Rails.application
