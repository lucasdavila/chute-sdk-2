module Chute
  module V2
    class Votes
      class << self

        def count(album_id, asset_id)
          Chute::Client.get("/v2/albums/#{album_id}/assets/#{asset_id}/votes")
        end

        def vote(album_id, asset_id)
          Chute::Client.post("/v2/albums/#{album_id}/assets/#{asset_id}/votes")
        end

        def remove_vote(album_id, asset_id, id)
          Chute::Client.delete("/v2/albums/#{album_id}/assets/#{asset_id}/votes/#{id}")
        end

      end
    end
  end
end
