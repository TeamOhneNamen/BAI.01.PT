class Human
  def initialize(name)
    @name = name
  end
  
  def kill(other)
    other.die
  end
  
  def pet(pet)
    pet.pet
  end
  def feed(pet)
    pet.feed
  end
end