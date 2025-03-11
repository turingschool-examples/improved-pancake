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
        @items.select do |item|
            item.bids.empty?
        end
    end

    def potential_revenue
        @items.sum do |item|
            item.current_high_bid.to_i
        end
    end
    
    def bidders 
        all_bidders = @items.map do |item|
            item.bids.keys
        end.flatten
        bidder_names = all_bidders.map do |bidder|
            bidder.name
        end 
    end

   def bidder_info
        auction_info = {}
        @items.each do |item|
            item.bids.each do |attendee, bid_amount|
                if auction_info[attendee] == nil
                    auction_info[attendee] = {}
                    auction_info[attendee][:budget] = attendee.budget
                    auction_info[attendee][:items] = []
                end
                auction_info[attendee] ||= {budget: attendee.budget}
                auction_info[attendee][:items] << item
            end
        end
        auction_info
    end
end