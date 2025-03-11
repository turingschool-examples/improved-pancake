class Item
    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = {}
    end

    def add_bid(attendee, budget)
      @bids[attendee] = budget

    end
end