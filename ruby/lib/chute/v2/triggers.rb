module Chute
  module V2
    class Triggers
      class << self

        # Asset Tags
        def all
          Chute::Client.get("/v2/triggers")
        end

        def create(url, event)
          Chute::Client.post("/v2/triggers", :url => url, :event => event)
        end

        def update(trigger_id,url, event)
          Chute::Client.put("/v2/triggers/#{trigger_id}", :url => url, :event => event)
        end

        def delete(trigger_id)
          Chute::Client.delete("/v2/triggers/#{trigger_id}")
        end

      end
    end
  end
end