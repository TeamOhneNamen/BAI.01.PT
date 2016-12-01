require_relative './pet.rb'
require_relative './human.rb'

class Cat < Pet
  def initialize(name, race = "cat", owner = nil, lifes = 9)
    create(name, race, owner, lifes)
    @staff = []
    add_staff('john')
  end
  
  def kill(other)
    other.die
  end
  
  def add_staff(name)
    @staff << h = Human.new(name)
  end
  
  protected def die
    if @lifes > 0 
      @lifes -= 1
    else
      raise ArgumentError, "#{@name} already died"
    end
  end
  
  def demand(action, which_staff = 0)
    if action == ('pet' ||'feed')
      @staff[which_staff].pet(self) if action == 'pet'
      @staff[which_staff].feed(self) if action == 'feed'
    else
      raise ArgumentError, 'choose between pet or feed'
    end
  end 
end