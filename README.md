Oystercard Challenge
 =================

This project is being conducted as part of the Makers Academy course. The aim of the project is to develop skills in the areas of TDD, learn new techniques for debugging and to improve familiarity with the Ruby coding language.

 1. I can write code that is easy to change.

 2. I can TDD anything.

 3. I can build with objects.

 Steps to run this program
 -------

 1. Clone to your local machine
 2. Run the command `gem install bundle` (if you don't have bundle already)
 3. When the installation completes, run `bundle`

 Using this program
 -------

 This is an example of how you could use this program in irb. You will need to `require` the `oyster.rb` file first:
 ```
 irb
 > require './lib/oyster.rb
  => true
 > card = Oyster.new
  => #<Oyster:0x00007f95660a56d8 @balance=0, @journey_history=[]>
 > card.top_up(10)
  => 10
 > card.touch_in("Aldgate East")
  => "Aldgate East"
 > card.touch_out("Hammersmith")
  => [{:entry=>"Aldgate East", :exit=>"Hammersmith"}]
 > card.touch_in("Hammersmith")
  => "Hammersmith"
 > card.touch_out("Barons Court")
  => [{:entry=>"Aldgate East", :exit=>"Hammersmith"}, {:entry=>"Hammersmith", :exit=>"Barons Court"}]
 > card.journey_history
  => [{:entry=>"Aldgate East", :exit=>"Hammersmith"}, {:entry=>"Hammersmith", :exit=>"Barons Court"}]
 > card.balance
  => 8
 ```

 My Approach
 ---------

At the beginning of the challenge, I was given the following tasks and user stories. 

 ```
 In order to use public transport
 As a customer
 I want money on my card
 
 In order to keep using public transport
 As a customer
 I want to add money to my card
 
 In order to protect my money
 As a customer
 I don't want to put too much money on my card

 In order to pay for my journey
 As a customer
 I need my fare deducted from my card
 
 In order to get through the barriers
 As a customer
 I need to touch in and out

 In order to pay for my journey
 As a customer
 I need to have the minimum amount for a single journey

 In order to pay for my journey
 As a customer
 I need to pay for my journey when it's complete

 In order to know where I have been
 As a customer
 I want to see to all my previous trips

 In order to be charged correctly
 As a customer
 I need a penalty charge deducted if I fail to touch in or out
```

 What I learned from this challenge
 -----
 
 * OOP.
 * TDD.
 * Writing easy to change and easy to read code.
 * Practice with user stories.
 * Practice with domain modelling.


 Acknowledgements
 -----

 Makers Academy Challenge.
