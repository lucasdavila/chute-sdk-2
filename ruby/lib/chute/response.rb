require 'hashie/mash'

module Chute
  class Response < Hashie::Mash

    def self.with_code_and_error(code, error)
      object        = Chute::Response.new
      object.response.code   = code
      object.response.errors = [error]
      object
    end

    def success?
      [200, 201].include?(response.code)
    end

    def print
      puts to_yaml
    end
    def to_pretty_json
      puts JSON.pretty_generate self
    end
  end
end
