module Chute
  class Response < Object

    attr_accessor :code
    attr_accessor :data
    attr_accessor :meta
    attr_accessor :pagination
    attr_accessor :parent
    attr_accessor :errors

    def self.new(data=nil)
      object       = super()
      return object unless data

      object.code  = data.response.code.to_i

      if object.success?
        if data.parsed_response
          object.data       = Chute::ChuteObject.parse(data.parsed_response['data'])
          object.meta       = Chute::ChuteObject.parse(data.parsed_response['meta']) unless data.parsed_response['meta'].blank?
          object.pagination = Chute::ChuteObject.parse(data.parsed_response['pagination']) unless data.parsed_response['pagination'].blank?
          object.parent     = Chute::ChuteObject.parse(data.parsed_response['parent']) unless data.parsed_response['parent'].blank?
        end
      else
        object.errors = data.parsed_response['errors']
      end

      object
    end

    def self.with_code_and_error(code, error)
      object        = Chute::Response.new
      object.code   = code
      object.errors = [error]
      object
    end

    def success?
      [200, 201].include?(code)
    end

    def method_missing(meth, *args, &block)
      data.send(meth, *args, &block)
    end

  end
end
