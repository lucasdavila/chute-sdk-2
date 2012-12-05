module Chute
  module V2
    class Flags
      class << self

        def count(album_id, asset_id)
          Chute::Client.get("/v2/albums/#{album_id}/assets/#{asset_id}/flags")
        end

        def flag(album_id, asset_id)
          Chute::Client.post("/v2/albums/#{album_id}/assets/#{asset_id}/flags")
        end

        def unflag(album_id, asset_id, id)
          Chute::Client.delete("/v2/albums/#{album_id}/assets/#{asset_id}/flags/#{id}")
        end

      end
    end
  end
end
