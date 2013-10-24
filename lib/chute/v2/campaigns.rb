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

        [:temp, :private, :public].each do |type|
          define_method "#{type}_storage_create" do |campaign_id, data|
            Chute::Client.post("/v2/campaigns/#{campaign_id}/store/#{type}", data)
          end

          define_method "#{type}_storage_update" do |campaign_id, store_id, data|
            Chute::Client.put("/v2/campaigns/#{campaign_id}/store/#{type}/#{store_id}", data)
          end

          define_method "#{type}_storage_find" do |campaign_id, store_id|
            Chute::Client.get("/v2/campaigns/#{campaign_id}/store/#{type}/#{store_id}")
          end
        end

      end
    end
  end
end
