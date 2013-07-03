require "httparty"
require "rest_client"

Dir[File.dirname(__FILE__) + '/chute/**/*.rb'].each do |file|
  require file
end

module Chute
  extend Configuration
end
