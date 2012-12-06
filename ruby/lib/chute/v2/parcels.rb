module Chute
  module V2
    class Parcels
      class << self

        def all_parcel_assets(parcel_id)
          Chute::Client.get("/v2/parcels/#{parcel_id}/assets")
        end

        def find(id)
          Chute::Client.get("/v2/parcels/#{id}")
        end

        def all_album_parcels(album_id)
          Chute::Client.get("/v2/albums/#{album_id}/parcels")
        end

      end
    end
  end
end
