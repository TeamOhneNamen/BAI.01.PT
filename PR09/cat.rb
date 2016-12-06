# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './pet.rb'
require_relative './human.rb'

class Cat < Pet
  def initialize(name, owner = nil, race = "cat", lifes = 9)
    @staff = []
    @owner = []
    if owner != nil
      @staff << "#{owner}"
      @owner << owner.to_s
    end 
      @owner_id = @staff 
    create(name, @owner, race, lifes)
  end
  
  def kill(other)
    if other != self
      other.die
    end
  end
  
  def add_staff(human)
    @staff << human
    @owner << human.to_s
    human.add_pet(self)
  end
  
  protected def die
  
    if @lifes > 0 
      @lifes -= 1
    else
      raise ArgumentError, "#{@name} already died"
    end
  end
  
  def pet(name)
    if @staff.include?(name)
      @petted = true
    else 
      raise ArgumentError, "is not a waiter from #{@name}"
    end
  end
  def feed(name)
    if @staff.include?(name)
      @feeded = true
    else
      raise ArgumentError, "is not a waiter from #{@name}"
    end
  end
end