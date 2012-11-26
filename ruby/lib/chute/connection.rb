require 'httparty'
require 'json'

module Chute
  class Connection
    include HTTParty
    format :json

    def self.base_uri
      Chute.api_endpoint
    end

    def self.headers
      {
          'Authorization' => "OAuth #{Chute.access_token}",
          'Content-Type' => 'application/json',
          'Accepts' => 'application/json',
          'x-client_id' => Chute.app_id
      }
    end

    def self.request(request_type, url, body="")
      body = JSON.unparse(body) unless String === body
      options = body.empty? ? {:headers => headers} : {:headers => headers, :body => body}
     puts headers
      begin
        response = self.send(request_type, "#{base_uri}#{url}", options)

        puts "----------------------------------------"
        puts "Requesting url: #{base_uri}#{url}"
        puts response.parsed_response
        puts "----------------------------------------"

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
      Chute::Response.new(object)
    end
  end

  class ChuteApiUnavailableException < Exception;
  end
  class ChuteApiInternalException < Exception;
  end
end
