require 'httparty'

module Chute
  class Connection
    include HTTParty
    format :json

    def self.base_uri
      "http://#{Chute.api_endpoint}"
    end

    def self.headers
      {
        'Authorization' => Chute.access_token,
        'Content-Type'  => 'application/json',
        'Accepts'       => 'application/json'
      }
    end

    def self.request(format, url, body="")
      body    = JSON.unparse(body) unless String === body
      options = body.blank? ? { :headers=> headers } : { :headers=> headers, :body=> body }

      begin
        response = self.send(format, "#{base_uri}#{url}", options)

        if Rails.env.development?
          Rails.logger.info "----------------------------------------"
          Rails.logger.info "Requesting url: #{base_uri}#{url}"
          Rails.logger.info response.parsed_response
          Rails.logger.info "----------------------------------------"
        end

        parse(response)
      rescue Errno::ECONNREFUSED
        p 'Service Unavailable'
        Chute::Response.with_code_and_error(503, 'Service Unavailable')
        raise ChuteApiUnavailableException.new('Could not connect to the Server')
      rescue MultiJson::DecodeError
        p 'Internal Server Error'
        Chute::Response.with_code_and_error(500, 'Internal Server Error')
        raise ChuteApiInternalException.new('Chute API Exception')
      rescue Exception=> ex
        p 'Unknown Error'
        raise
      end
    end

    def self.parse(object)
      Chute::Response.new(object)
    end
  end

  class ChuteApiUnavailableException < Exception;end
  class ChuteApiInternalException < Exception;end
end
