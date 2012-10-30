module Chute
  module V2
    class Users < ChuteObject
      class << self

        def find(id)
          Chute::Client.get("/v2/users/#{id}")
        end

        def me
          Chute::Client.get("/v2/me")
        end

      end
    end
  end
end

