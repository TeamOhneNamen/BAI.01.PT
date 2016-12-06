# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require 'date'

class Pet
  def create(name, owner, race, lifes = 1)
    @name = name
    @race = race
    @birth = Date.new(2009,04,03)
    @lifes = lifes
    @petted = false
    @feeded = false
  end

  def to_s
    "#{@name}, is a #{@race}, was born #{@birth}, has still #{@lifes} to live, his/her owner: #{@owner}, petted: #{@feeded}, feeded #{@petted}"
  end

  def lifes_out
    @lifes
  end

  def name_out
    @name
  end

  def date_out
    @birth.to_s
  end

  def petted_out
    @petted
  end
  
  def feeded_out
    @feeded
  end

  def pet
    @petted = true
  end

  def feed
    @feeded = true
  end
end

