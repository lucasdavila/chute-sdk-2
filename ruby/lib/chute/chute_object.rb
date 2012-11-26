module Chute
  class ChuteObject

    def to_param
      id.to_s
    end

    def as_json(options={})
      data
    end
  end
end
