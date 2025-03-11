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

    describe "#add_item"
    it "can add items" do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')

        expect(auction.items).to eq([])

        auction.add_item(item1)
        auction.add_item(item2)

        expect(auction.items).to eq([item1, item2])
    end
    describe "#item_name"
    it "can add items" do
        auction = Auction.new
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')

        expect(auction.item_names).to eq([])

        auction.add_item(item1)
        auction.add_item(item2)

        expect(auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end

    describe "biding" do

    it "can add items" do
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

        expect(item1.bids).to eq({})
    end   
        it "can add bids" do 
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

            expect(item1.bids).to eq({})

            item1.add_bid(attendee2, 20)
            item1.add_bid(attendee1, 22)

            expected ={
                attendee2 => 20,
                attendee1 => 22
            }

            expect(item1.bids).to eq(expected)
        end

        it "can see current high bid" do
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

            expect(item1.bids).to eq({})

            item1.add_bid(attendee2, 20)
            item1.add_bid(attendee1, 22)

            expect(item1.current_high_bid).to eq(22)
        end

        it "can tell what items are unpopuler" do
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

            expect(auction.unpopular_items).to eq([item2, item3, item5])

            item3.add_bid(attendee2, 15)

            expect(auction.unpopular_items).to eq([item2, item5])

            expect(auction.potential_revenue).to eq(87)
        end

        it "can see who is bidding" do
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

            expect(auction.bidders).to eq(["Bob","Megan", "Mike"])
        end

        it "#bidder_info" do
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

            item1.add_bid(attendee1, 22)
            item1.add_bid(attendee2, 20)
            item4.add_bid(attendee3, 50)

            expected = {
                attendee1 => {
                    :budget => 50,
                    :items => [item1]
                },
                attendee2 => {
                    :budget => 75,
                    :items => [item1]
                },
                attendee3 => {
                    :budget => 100,
                    :items => [item4]
                }
            }

            expect(auction.bidder_info).to eq(expected)
        end

    end


end