module Chute
  module V1
    class Apps
      class << self

        def index
          Chute::Client.get("v1/me/apps")
        end

        def all(page)
          Chute::Client.get("v1/me/apps?page=#{page}")
        end

        def find(id)
          Chute::Client.get("v1/apps/#{id}")
        end

        def create(data)
          Chute::Client.post("v1/apps", {:data => data})
        end

        def update(id, data)
          Chute::Client.put("v1/apps/#{id}", {:data => data})
        end

        def delete(id)
          Chute::Client.delete("v1/apps/#{id}")
        end

        def inbox(id, page)
          Chute::Client.get("v1/apps/#{id}/inbox", :page => page)
        end

        def users
          Chute::Client.get("v1/users")
        end

        # members of the single app
        def members(id)
          Chute::Client.get("v1/apps/#{id}/members")
        end

        def add_members(id, data)
          Chute::Client.post("v1/apps/#{id}/members/add", {:data => data})
        end
      end
    end
  end
end
