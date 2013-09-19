module Chute
  module V2
    class Campaigns
      class << self
        # Campaign Listing
        def all(page=nil, per_page=nil)
          Chute::Client.get("/v2/campaigns", :page=> page, :per_page=> per_page)
        end

        # Campaign Details
        def find(id)
          Chute::Client.get("/v2/campaigns/#{id}")
        end

        # Campaign Create
        def create(campaign)
          Chute::Client.post("/v2/campaigns", :campaign => campaign)
        end

      end
    end
  end
end
