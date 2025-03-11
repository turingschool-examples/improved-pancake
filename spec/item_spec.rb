require './lib/item'
require 'pry'

RSpec.describe Item do
    it 'exists and has attributes' do
        item1 = Item.new('Chalkware Piggy Bank')
        item2 = Item.new('Bamboo Picture Frame')

        expect(item1).to be_a(Item)
        expect(item1.name).to eq('Chalkware Piggy Bank')
        expect(item1.bids).to eq({})

        expect(item2).to be_a(Item)
        expect(item2.name).to eq('Bamboo Picture Frame')
    end
end