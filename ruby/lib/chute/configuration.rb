module Chute
  module Configuration

    VALID_CONNECTION_KEYS = [:api_endpoint, :auth_endpoint].freeze
    VALID_OPTIONS_KEYS    = [:app_id, :app_secret, :access_token].freeze
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS


    DEFAULT_API_ENDPOINT    = 'http://api.getchute.com'
    DEFAULT_AUTH_ENDPOINT   = 'http://getchute.com/auth'

    DEFAULT_APP_ID          = 'app_id'
    DEFAULT_APP_SECRET      = 'app_secret'
    DEFAULT_ACCESS_TOKEN    = 'access_token'


    attr_accessor *VALID_CONFIG_KEYS

    def options
      Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end

    def configure
      yield(self)
    end

    def self.extended(base)
      base.reset
    end

    def reset
      self.api_endpoint       = DEFAULT_API_ENDPOINT
      self.auth_endpoint      = DEFAULT_AUTH_ENDPOINT

      self.app_id             = DEFAULT_APP_ID
      self.app_secret         = DEFAULT_APP_SECRET
      self.access_token       = DEFAULT_ACCESS_TOKEN
    end

  end
end