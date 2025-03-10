# Auction

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!
* Record a video explaining 1 of the iteration 3 method you completed.

## Iteration 0 - Bug Fixing

There are some existing tests and classes, with 1 failing test.  Make that test pass before moving on!

## Iteration 1 - Items, Attendees & Auctions

Use TDD to create Item, Attendee, & Auction that will respond to the interaction pattern below:

**Graded Functionality**
1. Auction #add_item(item)
2. Auction #item_names

```ruby
pry(main)> require './lib/item'
#=> true
pry(main)> require './lib/auction'
#=> true
pry(main)> require './lib/attendee'
#=> true

pry(main)> item1 = Item.new('Chalkware Piggy Bank')
#=> #<Item:0x00007fbda98fa1b0 @bids={}, @name="Chalkware Piggy Bank">

pry(main)> item1.name
#=> "Chalkware Piggy Bank"

pry(main)> item2 = Item.new('Bamboo Picture Frame')
#=> #<Item:0x00007fbda91874f0 @bids={}, @name="Bamboo Picture Frame">

pry(main)> attendee = Attendee.new({name: 'Megan', budget: '$50'})
#=> #<Attendee:0x00007fbda913f038 @budget=50, @name="Megan">

pry(main)> attendee.name
#=> "Megan"

pry(main)> attendee.budget
#=> 50

pry(main)> auction = Auction.new
#=> #<Auction:0x00007fbda90f1cc0 @items=[]>

pry(main)> auction.items
#=> []

pry(main)> auction.add_item(item1)
pry(main)> auction.add_item(item2)

pry(main)> auction.items
#=> [#<Item:0x00007fbda98fa1b0 ...>, #<Item:0x00007fbda91874f0 ...>]

pry(main)> auction.item_names
#=> ["Chalkware Piggy Bank", "Bamboo Picture Frame"]

```

## Iteration 2 - Bidding!

Use TDD to update your classes to respond to the following interaction pattern.  Some notes:
- `unpopular_items` are those items which have no bids.
- `potential_revenue` is the sum of each item's highest bid.

**Graded Functionality**
1. Item #add_bid(attenddee, bid_amount)
2. Item #current_high_bid
3. Auction #unpopular_items
4. Auction #potential_revenue


```ruby
pry(main)> require './lib/item'
#=> true

pry(main)> require './lib/auction'
#=> true

pry(main)> require './lib/attendee'
#=> true

pry(main)> item1 = Item.new('Chalkware Piggy Bank')
#=> #<Item:0x00007fdc07956ab0 @bids={}, @name="Chalkware Piggy Bank">

pry(main)> item2 = Item.new('Bamboo Picture Frame')
#=> #<Item:0x00007fdc07925280 @bids={}, @name="Bamboo Picture Frame">

pry(main)> item3 = Item.new('Homemade Chocolate Chip Cookies')
#=> #<Item:0x00007fdc071ab040 @bids={}, @name="Homemade Chocolate Chip Cookies">

pry(main)> item4 = Item.new('2 Days Dogsitting')
#=> #<Item:0x00007fdc088fb6f0 @bids={}, @name="2 Days Dogsitting">

pry(main)> item5 = Item.new('Forever Stamps')
#=> #<Item:0x00007fdc071695f0 @bids={}, @name="Forever Stamps">

pry(main)> attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
#=> #<Attendee:0x00007fdc088f0e08 @budget=50, @name="Megan">

pry(main)> attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
#=> #<Attendee:0x00007fdc071131c8 @budget=75, @name="Bob">

pry(main)> attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
#=> #<Attendee:0x00007fdc070e2190 @budget=100, @name="Mike">

pry(main)> auction = Auction.new
#=> #<Auction:0x00007fdc0799de60 @items=[]>

pry(main)> auction.add_item(item1)

pry(main)> auction.add_item(item2)

pry(main)> auction.add_item(item3)

pry(main)> auction.add_item(item4)

pry(main)> auction.add_item(item5)

pry(main)> item1.bids
#=> {}

pry(main)> item1.add_bid(attendee2, 20)

pry(main)> item1.add_bid(attendee1, 22)

pry(main)> item1.bids
#=> {
#     #<Attendee:0x00007fdc071131c8 ...> => 20,
#     #<Attendee:0x00007fdc088f0e08 ...> => 22
#   }

pry(main)> item1.current_high_bid
#=> 22

pry(main)> item4.add_bid(attendee3, 50)

pry(main)> auction.unpopular_items
#=> [#<Item:0x00007fdc07925280 ...>, #<Item:0x00007fdc071ab040 ...>, #<Item:0x00007fdc071695f0 ...>]

pry(main)> item3.add_bid(attendee2, 15)

pry(main)> auction.unpopular_items
#=> [#<Item:0x00007fdc07925280 ...>, #<Item:0x00007fdc071695f0 ...>]

pry(main)> auction.potential_revenue
#=> 87

```

## Iteration 3 - More bidding stuff!

Use TDD to update your classes to include the following functionality. 

**Graded Functionality**
You must complete at least 2 of the 3 methods to pass. If you have time, we suggest doing all 3. 

Some notes:
- `bidder_info` should return a hash with keys that are attendees, and values that are a hash with that attendee's budget and an array of items that attendee has bid on.
- `close_bidding` should update the item so that it will not accept additional bids

| Class | Instance Method Name | Return Value |
| ----------- | ----------- | ------------ |
| `Auction` | `bidders` | Array of bidders' names as `String`; ex: ["Megan", "Bob", "Mike"] |
| `Auction` | `bidder_info` | `Hash` with the following format: key of `Attendee` object pointing to a value of a `Hash`. The subhash should have a key of `:budget` as a `Symbol` and value of their budget as an `Integer`. The subhash should have a second key of `:items` as a `Symbol` with a value that is an `Array` of items the attendee has bid on. See example below. |
| `Item` | `close_bidding` | Return value of your choice; ensure it follows the spec above such that closing the bidding on an item makes it so the item will no longer accept new bids. |

Example return value hash for `bidder_info`
```ruby
 # {
 #    #<Attendee:0x00007ff177a45108 @budget=50, @name="Megan"> =>
 #      {
 #        :budget => 50,
 #        :items => [#<Item:0x00007ff17702e2a0 ...>]
 #      },
 #    #<Attendee:0x00007ff17816a4b0 @budget=75, @name="Bob"> =>
 #      {
 #        :budget => 75,
 #        :items => [#<Item:0x00007ff17702e2a0...>, #<Item:0x00007ff177ae45f0 ...>]
 #      },
 #    #<Attendee:0x00007ff177a0f5f8 @budget=100, @name="Mike"> =>
 #      {
 #        :budget => 100,
 #        :items => [#<Item:0x00007ff177a9d858...>]
 #      }
 #   }
 ```
