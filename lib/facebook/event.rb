module Facebook
  class Event
    attr_accessor :facebook_id

    def initialize(facebook_id)
      @facebook_id = facebook_id
    end

  end
end
