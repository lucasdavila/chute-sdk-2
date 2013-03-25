module Chute
  module V2
    class Assets
      class << self
        # Asset Listing
        def all(album_id)
          Chute::Client.get("/v2/albums/#{album_id}/assets")
        end

        # Asset Details
        def find(id)
          Chute::Client.get("/v2/assets/#{id}")
        end

        # Asset Geo Locate
        def geo_locate(lat, lng, radius)
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
        def upload(data)
          Chute::Client.post("/v2/assets/upload", :urls => urls)
        end

        def import(params)
          Chute::Client.post("/v2/assets/import", params)
        end

        # Asset Update
        # Title
        def update(id, asset={})
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
