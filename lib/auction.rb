require 'pry'
class Auction
    attr_reader :items
    def initialize
        @items = []
    end

    def add_item(item)
        @items << item
    end

    def item_names
        result = []
        @items.each do |item|
          result << item.name
        end
        result
    end

    def unpopular_items
        @items.select do |item|
            item.bids.empty?
        end
    end

    def potential_revenue
        @items.sum do |item|
            item.bids.values.max.to_i
        end
    end 
end