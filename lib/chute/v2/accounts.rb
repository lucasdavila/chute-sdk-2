module Chute
  module V2
    class Accounts
      class << self
        # Accounts Listing
        def me
          Chute::Client.get("/v2/me/accounts")
        end

        def find(id)
          Chute::Client.get("/v2/accounts/#{id}")
        end
      end
    end
  end
end

