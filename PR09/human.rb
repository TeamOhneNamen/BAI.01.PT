# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './cat.rb'

class Human

  
  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end
  
  def to_s
    "#{@name}"
  end

  def kill(other)
    other.die
  end

  def pet(pet)
    pet.pet(self)
  end

  def feed(pet)
    pet.feed(self)
  end
end