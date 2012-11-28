module Chute
  module V2
    class Comments
      class << self

        # Assets Comments
        def all(id)
          Chute::Client.get("/v2/assets/#{id}/tags")
        end

        def update_tags(id, tags)
          Chute::Client.put("/v2/assets/#{id}/tags", :tag => tags)
        end


        def add_tags(id, tags)
          Chute::Client.post("/v2/assets/#{id}/tags", :tag => tags)
        end

      end
    end
  end
end

