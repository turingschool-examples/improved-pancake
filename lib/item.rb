class Item
    attr_reader :name, :bids

    def initialize(name)
        @name = name
        @bids = {}
    end

    def add_bid(attendee, budget)
      @bids[attendee] = budget unless @bids.frozen?

    end

    def current_high_bid
      @bids.values.max
    end
    
    def close_bidding
      @bids.freeze
    end

end