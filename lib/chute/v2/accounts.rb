module Chute
  module V2
    class Accounts
      class << self
        # Accounts Listing
        def me
          Chute::Client.get("/v2/me/accounts")
        end
      end
    end
  end
end

