require 'date'
class Pet
  
  def create(name, race, owner = nil, lifes = 1)
    @name = name
    @race = race
    @owner = owner
    @birth = Date.new(2000,12,12)
    @lifes = lifes
    @petted = false
    @feeded = false
  end
  
  def to_s
    "#{@name}, is a #{@race}, was born #{@birth}, has still #{@lifes} to live, his/her owner: #{@owner}, petted: #{@feeded}, feeded #{@petted}"
  end
  def pet
    @petted = true
  end
  def feed
    @feeded = true
  end
end

