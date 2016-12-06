require_relative './pet.rb'
require_relative './cat.rb'
require_relative './dog.rb'
require_relative './human.rb'

kitty = Cat.new("kitty")
puts kitty

peter = Human.new("peter")

rex = Dog.new("Rex", peter)
puts rex

john = Human.new("john")


fluffy = Cat.new("fluffy")
puts fluffy
fluffy.kill(kitty)
puts kitty
kitty.add_staff(john)
puts kitty
kitty.add_staff(peter)
puts kitty
john.feed(kitty)
puts kitty
john.pet(kitty)
kitty.kill(fluffy)