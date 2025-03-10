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
end