require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit

begin
    sam = BestFriend.new('Joe', 1, 'Pun-crafting')
    joe = BestFriend.new('', 5, '')
rescue FriendshipError => e
    puts e.message
    sam = BestFriend.new("Sam", 6, "Pun-crafting")
rescue InformationError => e2
    puts e2.message
    sam = BestFriend.new("Joe", 6, "Pun-crafting")
end

p joe
p sam 


sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet

