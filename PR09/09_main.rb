require_relative './pet.rb'
require_relative './cat.rb'
require_relative './human.rb'

kitty = Cat.new("kitty")
puts kitty

#john = Human.new

fluffy = Cat.new("fluffy")
fluffy.kill(kitty)
#john.kill(kitty)
#10.times{fluffy.die}
#fluffy.add_staff
fluffy.demand('pet')
puts fluffy
puts kitty