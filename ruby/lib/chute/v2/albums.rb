module Chute
  module V2
    class Albums < ChuteObject
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
        def geo_search(id, lat, lng, radius)
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
        def update(id, album)
          Chute::Client.put("/v2/albums/#{id}", album)
        end

        # Album Delete
        def delete(id)
          Chute::Client.delete("/v2/albums/#{id}")
        end
      end
    end
  end
end
