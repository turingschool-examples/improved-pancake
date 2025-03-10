require './lib/item'
require 'pry'

RSpec.describe Item do
    it 'exists and has attributes' do
        item = Item.new('Chalkware Piggy Bank')

        expect(item).to be_a(Item)
        expect(item.name).to eq('Chalkware Piggy Bank')
        expect(item.bids).to eq({})
    end
end