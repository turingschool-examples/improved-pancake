require './lib/item'
require 'pry'
 require './lib/auction'
 require './lib/attendee'

RSpec.describe Item do
  before :each do
    @item = Item.new('Chalkware Piggy Bank')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
  end
    it 'exists and has attributes' do
        expect(@item).to be_a(Item)
        expect(@item.name).to eq('Chalkware Piggy Bank')
        expect(@item.bids).to eq({})
    end
    
    it 'can add bids' do
      @item.add_bid(@attendee2, 20)
      @item.add_bid(@attendee1, 22)

      expect(@item.bids).to eq({
        @attendee2 => 20,
        @attendee1 => 22
      })
    end

end