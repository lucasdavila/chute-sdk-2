require "httparty"
require 'active_support/all'

Dir[File.dirname(__FILE__) + '/chute/*.rb'].each do |file|
  require file
end

module Chute

  mattr_accessor :app_id, :app_secret, :access_token, :api_path

  self.api_path      = 'http://api.getchute.com'
  self.app_id        = 'app_id'
  self.app_secret    = 'app_secret'
  self.access_token  = 'access_token'

  def self.config(&block)
    yield(self)
  end
end