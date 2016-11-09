# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Diese Klasse empfängt die Daten vom User(besitzt Exeption)
class Daten
  
  attr_accessor :z1, :z2, :z3, :z4 
  
  def initialize()
    
    @z1
    @z2
    @z3
    @z4
    
  end
  
  def input
    
    @z1 = gets.chomp.to_i
    exception(@z1)
    @z2 = gets.chomp.to_i
    exception(@z2)
    @z3 = gets.chomp.to_i
    exception(@z3)
    @z4 = gets.chomp.to_i
    exception(@z4)
    
  end
  
  def exception(input)
    if (input < 1 || input > 4)
      raise ArgumentError, "should be a number between 1-4"
    end
  end
  
end