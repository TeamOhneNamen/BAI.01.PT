# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './pet.rb'
require_relative './human.rb'
require_relative './dog.rb'
require_relative './cat.rb'
require 'test/unit'

class RUnitMastermind < Test::Unit::TestCase
  def setup()
    @cat = Cat.new("garfield")
    fluffy.kill(kitty)
    #john.kill(kitty)
    #10.times{fluffy.die}
    #fluffy.add_staff
    fluffy.demand('pet')
    puts fluffy
    puts kitty
  end
  def cat_test
    assert_raise(@cat.demand('petto'))
    
  end
end