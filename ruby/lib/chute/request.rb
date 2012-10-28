module Chute
  class Request
    class << self
      ['get', 'post', 'put', 'delete'].each do |req_type|
        define_method(req_type) do |url, data={}|
          Connection.request(req_type, url, data)
        end
      end
    end
  end
end
