module Chute
  module V2
    class Assets < ChuteObject
      class << self
        # Asset Listing
        def all
          Chute::Request.get("/v2/assets")
        end

        # Asset Geo Search
        def geo_search(lat_lng, radius)
          Chute::Request.get("/v2/assets/geo/#{lat_lng}/#{radius}")
        end

        # Asset Details
        def find(id)
          Chute::Request.get("/v2/assets/#{id}")
        end

        # Asset Exif
        def exif(id)
          Chute::Request.get("/v2/assets/#{id}/exif")
        end

        # Asset Geo
        def geo(id)
          Chute::Request.get("/v2/assets/#{id}/geo")
        end

        # Asset Import
        def create(data)
          Chute::Request.post("/v2/assets/_upload", :urls=> urls)
        end

        # Album Update
        def update(id, data)
          Chute::Request.put("/v2/assets/#{id}", data)
        end

        # Album Delete
        def delete(id)
          Chute::Request.delete("/v2/assets/#{id}")
        end
      end
    end
  end
end
