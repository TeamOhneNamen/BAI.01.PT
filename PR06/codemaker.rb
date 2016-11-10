# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Diese Klasse generiert ein Mastermind-Code
class Codemaker
  def initialize()
    @code = []
  end

  def generate_code (length, range)
    length.times {@code.push(Random.rand(1..range))}
  end

  def code
    @code.clone
  end  
  
  def to_s
    "uhrcode: #{@code}"

    "Code: #{@code}"

  end
  
end