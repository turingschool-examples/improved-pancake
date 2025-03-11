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
end