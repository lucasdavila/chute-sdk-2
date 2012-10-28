require "httparty"
Dir[File.dirname(__FILE__) + '/chute/*.rb'].each do |file|
  require file
end