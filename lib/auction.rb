class Auction
    attr_reader :items

    def initialize
        @items = []
        
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

    def bidders
      all_bidders = []
      @items.each do |item|
        item.bids.each_key do |attendee|
          all_bidders << attendee.name
        end
      end
      all_bidders
    end
    
    def bidder_info
      hash = {}
      @items.each do |item|
        item.bids.each do |attendee, budget|
          if hash[attendee]
            hash[attendee][:items] << item
          else
            hash[attendee] = {:budget => attendee.budget, :items => [item]}
          end
        end
      end
      hash
    end
    
end