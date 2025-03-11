require './lib/item'
require './lib/attendee'
require './lib/auction'
require 'pry'

RSpec.describe Auction do 
    it 'exists and has attributes' do
        auction = Auction.new

        expect(auction).to be_a(Auction)
        expect(auction.items).to eq([])
    end

    it 'adds items to auctions empty array' do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')

        auction.add_item(item1)
        auction.add_item(item2)

        expect(auction.items).to eq([item1, item2])
    end

    it 'returns an array of item names' do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')

        auction.add_item(item1)
        auction.add_item(item2)

        expect(auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
    
    it 'filters for unpopular items' do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')
        item3 = Item.new('Homemade Chocolate Chip Cookies')
        item4 = Item.new('2 Days Dogsitting')
        item5 = Item.new('Forever Stamps')

        attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
        
        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)
 
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22)            #`unpopular_items` are those items which have no bids.
        item4.add_bid(attendee3, 50)
        # binding.pry

        expect(auction.unpopular_items).to eq([item2, item3, item5])
    end

    it 'calculates potential revenue' do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')
        item3 = Item.new('Homemade Chocolate Chip Cookies')
        item4 = Item.new('2 Days Dogsitting')
        item5 = Item.new('Forever Stamps')

        attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
        
        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)
 
        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22) 
        item4.add_bid(attendee3, 50)    #is the sum of each item's highest bid.
        item3.add_bid(attendee2, 15)

        expect(auction.potential_revenue).to eq(87)
    end

    it '#bidders' do               
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')
        item3 = Item.new('Homemade Chocolate Chip Cookies')
        item4 = Item.new('2 Days Dogsitting')
        item5 = Item.new('Forever Stamps')

        attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
        attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
        
        auction.add_item(item1)
        auction.add_item(item2)
        auction.add_item(item3)
        auction.add_item(item4)
        auction.add_item(item5)

        item1.add_bid(attendee2, 20)
        item1.add_bid(attendee1, 22) 
        item4.add_bid(attendee3, 50)    
        item3.add_bid(attendee2, 15)     #Array of bidders' names as String; ex: ["Megan", "Bob", "Mike"]

        expect(auction.bidders).to eq(["Bob", "Megan", "Mike"])
    end
end