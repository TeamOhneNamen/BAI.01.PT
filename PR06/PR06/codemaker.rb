class Codemaker
  def initialize()
    @code = []
    @code_farben = []
    @z1 = "Blau"
    @z2 = "Rot"
    @z3 = "Grün"
    @z4 = "Gelb"
  end

  def generate_code

    4.times {@code.push(Random.rand(1..4))}
      
  end

  def code
    @code.clone
  end  
  
  def to_s

    "uhrcode: #{@code}"

  end
end