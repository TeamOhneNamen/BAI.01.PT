# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './pet.rb'

class Dog < Pet

  @owner
  def initialize(name, owner, race = "dog", lifes = 1)
    @owner = owner
    owner.add_pet(self)
    create(name, race, lifes)
  end

  def kill(other)
    other.die
  end

  def pet(name)
    @petted = true
  end

  def feed(name)
    @feeded = true
  end

end