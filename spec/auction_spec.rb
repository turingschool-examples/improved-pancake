require './lib/item'
require './lib/attendee'
require './lib/auction'
require 'pry'

RSpec.describe Auction do 
  before :each do 
    @auction = Auction.new
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
        expect(@auction).to be_a(Auction)
        expect(@auction.items).to eq([])
       
    end

    it 'can add itemes' do
    
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'returns an array of item name' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end

    it 'returns the unpopular_items' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      expect(@auction.unpopular_items).to eq([@item1, @item2, @item3, @item4, @item5]) 

      @item4.add_bid(@attendee3, 50)
      @item1.add_bid(@attendee2, 20)

      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])

      @item3.add_bid(@attendee2, 15)

      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end

    it 'calculated the potential_revenue' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item3.add_bid(@attendee2, 15)
      @item4.add_bid(@attendee3, 50)

      expect(@auction.potential_revenue).to eq(87)
    end

    it 'returns the bidders name' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee1, 20)
      @item2.add_bid(@attendee2, 30)
      @item3.add_bid(@attendee3, 40)

      expect(@auction.bidders).to eq(["Megan", "Bob", "Mike"])
    end

    it 'returns the bidder info' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @auction.add_item(@item3)
      @auction.add_item(@item4)
      @auction.add_item(@item5)

      @item1.add_bid(@attendee1, 20)
      @item2.add_bid(@attendee2, 30)
      @item3.add_bid(@attendee3, 40)

      expected = {
           @attendee1 =>
             {
               :budget => 50,
               :items => [@item1]
             },
           @attendee2 =>
             {
               :budget => 75,
               :items => [@item2]
             },
           @attendee3 =>
             {
               :budget => 100,
               :items => [@item3]
             }
          }
    expect(@auction.bidder_info).to eq(expected)
    end
end