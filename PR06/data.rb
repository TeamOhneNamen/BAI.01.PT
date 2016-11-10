# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Diese Klasse empfängt die Daten vom User(besitzt Exeption)
class Daten
  
  attr_accessor :z1, :z2, :z3, :z4 
  
  def initialize()
    @user_input = []
  end
  
  def input(length, range)
      i = 0
      length.times{
      @user_input << gets.chomp.to_i
      exception(@user_input[i], range) 
      i += 1 
      }
      return @user_input
  end
  
  def exception(input, range)
    if (input < 1 || input > range)
      raise ArgumentError, "should be a number between 1 - #{range}"
    end
  end
  
  def user_input
    @user_input.clone
  end
  
  def to_s
    "input: #{@user_input}"
  end  
  
end