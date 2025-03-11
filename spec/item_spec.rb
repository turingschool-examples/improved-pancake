require './lib/item'
require 'pry'
 require './lib/auction'
 require './lib/attendee'

RSpec.describe Item do
  before :each do
 
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps') 
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end
    it 'exists and has attributes' do
        expect(@item1).to be_a(Item)
        expect(@item1.name).to eq('Chalkware Piggy Bank')
        expect(@item1.bids).to eq({})
    end
    
    it 'can add bids' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@item1.bids).to eq({
        @attendee2 => 20,
        @attendee1 => 22
      })
    end

    it "returns the current_high bid" do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
    end
    
    it 'can close the bid for a certain item' do 
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({ @attendee1 => 22, @attendee2 => 20 })

      @item1.close_bidding

      @item1.add_bid(@attendee1, 30)

      expect(@item1.bids).to eq({ @attendee1 => 22, @attendee2 => 20 })


    end
end