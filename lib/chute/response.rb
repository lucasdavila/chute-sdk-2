require 'hashie/mash'

module Chute
  class Response < Hashie::Mash

    def self.with_code_and_error(code, error)
      object        = Chute::Response.new
      object.code   = code
      object.errors = [error]
      object
    end

    def success?
      [200, 201].include?(response.code)
    end

    def pretty_print
      puts JSON.pretty_generate self
    end

  end
end
