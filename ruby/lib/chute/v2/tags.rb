module Chute
  module V2
    class Tags
      class << self

        # Asset Tags
        def list_asset_tags(asset_id)
          Chute::Client.get("/v2/assets/#{asset_id}/tags")
        end

        # Change the complete list of tags for an asset inside an album
        def update_asset_tags(asset_id, *tags)
          Chute::Client.put("/v2/assets/#{asset_id}/tags", :tag => tags)
        end

        # Add new tags to existing assets, without replacing the current ones
        def add_asset_tags(asset_id, *tags)
          Chute::Client.post("/v2/assets/#{asset_id}/tags", :tag => tags)
        end

        def list_album_tags(album_id)
          Chute::Client.get("/v2/albums/#{album_id}/tags")
        end

        # Change the complete list of tags for an asset inside an album
        def update_album_tags(album_id, *tags)
          Chute::Client.put("/v2/albums/#{album_id}/tags", :tag => tags)
        end

        # Add new tags to existing assets, without replacing the current ones
        def add_album_tags(album_id, *tags)
          Chute::Client.post("/v2/albums/#{album_id}/tags", :tag => tags)
        end


      end
    end
  end
end

