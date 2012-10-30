module Chute
  module V2
    class Assets < ChuteObject
      class << self
        # Asset Listing
        def all
          Chute::Client.get("/v2/assets")
        end

        # Asset Details
        def find(id)
          Chute::Client.get("/v2/assets/#{id}")
        end

        # Asset Geo Search
        def geo_search(lat, lng, radius)
          Chute::Client.get("/v2/assets/geo/#{lat},#{lng}/#{radius}")
        end

        # Asset Exif
        def exif(id)
          Chute::Client.get("/v2/assets/#{id}/exif")
        end

        # Asset Geo
        def geo(id)
          Chute::Client.get("/v2/assets/#{id}/geo")
        end

        # TODO Implement on server: Asset Create
        def create(data)
          Chute::Client.post("/v2/assets/_upload", :urls => urls)
        end

        # Album Update
        def update(id, asset)
          Chute::Client.put("/v2/assets/#{id}", asset)
        end

        # Album Delete
        def delete(id)
          Chute::Client.delete("/v2/assets/#{id}")
        end
      end
    end
  end
end
