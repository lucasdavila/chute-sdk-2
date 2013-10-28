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

        def upload(album_id, f)
          response = RestClient::Request.execute(:url => "#{Chute.upload_endpoint}/v2/albums/#{album_id}/assets/upload", :method => :post,
                                                 :payload => {
                                                     :multipart => true,
                                                     :filedata => f
                                                 },:headers => {"Authorization" => "Bearer #{Chute.access_token}"}
          )
          Chute::Connection.parse(JSON.parse(response.body))
        end

        def import(urls, shortcuts)
          params = Hash.new
          params[:urls] = urls unless urls==nil
          params[:shortcuts] = shortcuts unless shortcuts==nil
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
