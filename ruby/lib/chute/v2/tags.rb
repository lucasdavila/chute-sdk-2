module Chute
  module V2
    class Tags
      class << self

        # Asset Tags
        def list_asset_tags(album_id, asset_id)
          Chute::Client.get("/v2/albums/#{album_id}/assets/#{asset_id}/tags")
        end

        # Change the complete list of tags for an asset inside an album
        def update_asset_tags(album_id, asset_id, *tags)
          Chute::Client.put("/v2/albums/#{album_id}/assets/#{asset_id}/tags", :tags => process_array(tags))
        end

        # Add new tags to existing assets, without replacing the current ones
        def add_asset_tags(album_id, asset_id, *tags)
          Chute::Client.post("/v2/albums/#{album_id}/assets/#{asset_id}/tags", :tags => process_array(tags))
        end

        private

        def process_array(*args)
          args.flatten.uniq
        end

      end
    end
  end
end

