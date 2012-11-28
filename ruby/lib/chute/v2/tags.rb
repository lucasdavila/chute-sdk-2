module Chute
  module V2
    class Tags
      class << self
        # Asset Tags
        def tags(id)
          Chute::Client.get("/v2/assets/#{id}/tags")
        end

        def update_tags(id, tags)
          Chute::Client.put("/v2/assets/#{id}/tags", :tag => tags)
        end

      end
    end
  end
end

