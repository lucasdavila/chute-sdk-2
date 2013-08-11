module Chute
  module V2
    class Albums
      class << self
        # Album Listing
        def all(page=nil, per_page=nil)
          Chute::Client.get("/v2/albums", :page=> page, :per_page=> per_page)
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
        def import(album_id, *urls)
          Chute::Client.post("/v2/albums/#{album_id}/assets/import", :urls=> urls)
        end

        # Import from Instagram Ids
        def import_from_instagram(album_id, *ids)
          Chute::Client.post("/v2/albums/#{album_id}/assets/import", :instagram_ids => ids)
        end

        # Album Create
        def create(album)
          Chute::Client.post("/v2/albums", :album => album)
        end

        # Album Update
        def update(id, album={})
          Chute::Client.put("/v2/albums/#{id}", :album => album)
        end

        # Album Delete
        def delete(id)
          Chute::Client.delete("/v2/albums/#{id}")
        end

        def stats(album_id)
          Chute::Client.get("/v2/albums/#{album_id}/stats")
        end

        def add_assets(album_id, *asset_ids)
          Chute::Client.post("/v2/albums/#{album_id}/add_assets", :asset_ids => asset_ids)
        end

        def remove_assets(album_id, *asset_ids)
          Chute::Client.post("/v2/albums/#{album_id}/remove_assets",:asset_ids => asset_ids)
        end

        # Move asset from one album to another, preserving all asset's metadata
        def move_asset(album_id, asset_id, to_album)
          Chute::Client.post("/v2/albums/#{album_id}/assets/#{asset_id}/move/#{to_album}")
        end

        # Copy asset from one album to another, carrying over all asset's metadata
        def copy_asset(album_id, asset_id, to_album)
          Chute::Client.post("/v2/albums/#{album_id}/assets/#{asset_id}/copy/#{to_album}")
        end

      end
    end
  end
end
