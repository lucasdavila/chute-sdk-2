module Chute
  module V2
    class Assets < ChuteObject
      class << self
        # Asset Listing
        def all
          Chute::Client.get("/v2/assets")
        end

        # Asset Geo Search
        def geo_search(lat_lng, radius)
          Chute::Client.get("/v2/assets/geo/#{lat_lng}/#{radius}")
        end

        # Asset Details
        def find(id)
          Chute::Client.get("/v2/assets/#{id}")
        end

        # Asset Exif
        def exif(id)
          Chute::Client.get("/v2/assets/#{id}/exif")
        end

        # Asset Geo
        def geo(id)
          Chute::Client.get("/v2/assets/#{id}/geo")
        end

        # Asset Import
        def create(data)
          Chute::Client.post("/v2/assets/_upload", :urls=> urls)
        end

        # Album Update
        def update(id, data)
          Chute::Client.put("/v2/assets/#{id}", data)
        end

        # Album Delete
        def delete(id)
          Chute::Client.delete("/v2/assets/#{id}")
        end
      end
    end
  end
end
