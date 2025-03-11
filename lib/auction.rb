class Auction
    attr_reader :items, :bids

    def initialize
        @items = []
        @bids = {}
    end

    def add_item(item)
      @items << item
    end

    def item_names
      @items.map do |item|
        item.name
      end
    end
    
    def unpopular_items
      @items.find_all do |item|
        item.bids.empty?
      end
    end

    def potential_revenue #is the sum of each item's highest bid.
      @items.sum do |item|
        item.current_high_bid.to_i
      end
    end
    
end