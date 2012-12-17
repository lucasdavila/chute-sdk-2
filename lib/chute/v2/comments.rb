module Chute
  module V2
    class Comments
      class << self

        # Assets Comments
        def all(album_id, asset_id)
          Chute::Client.get("/v2/albums/#{album_id}/assets/#{asset_id}/comments")
        end

        # Comment params
        # Params
        # comment_text
        # name
        # email
        def create(album_id, asset_id, comment={})
          Chute::Client.post("/v2/albums/#{album_id}/assets/#{asset_id}/comments", comment)
        end


        def delete(comment_id)
          Chute::Client.delete("/v2/comments/#{comment_id}")
        end

      end
    end
  end
end

