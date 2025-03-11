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

    def bidders 
        @items.flat_map do |item|  #used to extract the names of bidders from all items in auction and while flattening the arrays into one.
            item.bids.keys.map do |attendee|  #Retireves keys of bids hash for each item and maps over them to get the names of the attendees who placed bids.
                attendee.name #finds the attendee by name
            end
        end.uniq #enumerable that makes sure names aren't doubled 
    end
end