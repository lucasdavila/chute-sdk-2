module Chute
  module V2
    class Albums
      class << self
        # Album Listing
        def all
          Chute::Client.get("/v2/albums")
        end

        # Album Details
        def find(id)
          Chute::Client.get("/v2/albums/#{id}")
        end

        # Album Assets Geo Search
        def geo_locate(id, lat, lng, radius)
          Chute::Client.get("/v2/albums/#{id}/assets/geo/#{lat},#{lng}/#{radius}")
        end

        # Album Assets
        def assets(id, page, per_page)
          Chute::Client.get("/v2/albums/#{id}/assets", :page=> page, :per_page=> per_page)
        end

        # Import Album Assets
        def import(id, urls)
          Chute::Client.get("/v2/albums/#{id}/assets/import", :urls=> urls)
        end

        # Album Create
        def create(album)
          Chute::Client.post("/v2/albums", album)
        end

        # Album Update
        def update(id, album={})
          Chute::Client.put("/v2/albums/#{id}", album)
        end

        # Album Delete
        def delete(id)
          Chute::Client.delete("/v2/albums/#{id}")
        end

        def stats(album_id)
          Chute::Client.get("/v2/albums/#{album_id}/stats")
        end

        def add_assets(album_id, *asset_ids)
          Chute::Client.post("/v2/albums/#{album_id}/add_assets", :asset_ids =>  JSON.unparse(asset_ids))
        end

        def remove_assets(album_id, *asset_ids)
          Chute::Client.post("/v2/albums/#{album_id}/remove_assets",:asset_ids => JSON.unparse(asset_ids))
        end

      end
    end
  end
end
