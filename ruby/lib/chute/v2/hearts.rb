module Chute
  module V2
    class Hearts
      class << self

        def count(album_id, asset_id)
          Chute::Client.get("/v2/albums/#{album_id}/assets/#{asset_id}/hearts")
        end

        def heart(album_id, asset_id)
          Chute::Client.post("/v2/albums/#{album_id}/assets/#{asset_id}/hearts")
        end

        def unheart(album_id, asset_id, id)
          Chute::Client.delete("/v2/albums/#{album_id}/assets/#{asset_id}/hearts/#{id}")
        end

      end
    end
  end
end
