require 'httparty'
require 'json'
require 'hashie/mash'

module Chute
  class Connection
    include HTTParty
    format :json

    def self.base_uri
      Chute.api_endpoint
    end

    def self.headers
      {
          'Authorization' => "Bearer #{Chute.access_token}",
          'Content-Type' => 'application/json',
          'Accepts' => 'application/json',
          'x-client_id' => Chute.app_id
      }
    end

    def self.request(request_type, url, body="")
      body = body.to_json unless String === body
      options = body.empty? ? {:headers => headers} : {:headers => headers, :body => body}
      begin
        response = self.send(request_type, "#{base_uri}#{url}", options)
=begin

        puts "----------------------------------------"
        puts "Requesting url: #{base_uri}#{url}"
        puts response.parsed_response
        puts "----------------------------------------"
=end

        parse(response)
      rescue Errno::ECONNREFUSED
        p 'Service Unavailable'
        Chute::Response.with_code_and_error(503, 'Service Unavailable')
        raise ChuteApiUnavailableException.new('Could not connect to the Server')
      rescue MultiJson::DecodeError
        p 'Internal Server Error'
        Chute::Response.with_code_and_error(500, 'Internal Server Error')
        raise ChuteApiInternalException.new('Chute API Exception')
      rescue Exception => ex
        p 'Unknown Error'
        raise
      end
    end

    def self.parse(object)
      if object.respond_to?(:each_pair)
        Chute::Response.new(object)
      else
        [200, 201].include?(object.code)
      end
    end
  end

  class ChuteApiUnavailableException < Exception;
  end
  class ChuteApiInternalException < Exception;
  end
end
