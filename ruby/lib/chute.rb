require "httparty"
Dir[File.dirname(__FILE__) + '/chute/*.rb'].each do |file|
  require file
end

module Chute
  mattr_accessor :app_id, :app_secret, :access_token

  Chute.api_path      = 'http://api.getchute.com'
  Chute.app_id        = 'app_id'
  Chute.app_secret    = 'app_secret'
  Chute.access_token  = 'access_token'

  class << self

  end

  def self.config(&block)
    yield(self)
  end
end