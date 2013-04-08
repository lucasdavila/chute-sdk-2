require 'chute/configuration'

module Chute
  def self.as(token, &block)
    temp_token = Chute.access_token
    Chute.configure do |config|
      config.access_token = token
    end
    yield block
    Chute.configure do |config|
      config.access_token = temp_token
    end
  end

  class Client

    class << self
      ['get', 'post', 'put', 'delete'].each do |req_type|
        define_method(req_type) do |url, data={}|
          Chute::Connection.request(req_type, url, data)
        end
      end
    end

    # Define the same set of accessors as the Chute module
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      # Merge the config values from the module and those passed
      # to the client.
      merged_options = Chute.options.merge(options)

      # Copy the merged values to this client and ignore those
      # not part of our configuration
      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end


  end
end
