# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

class Human
  def initialize(name)
    @name = name
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