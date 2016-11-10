# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Diese Klasse enthält die logik zum Lösen des Codes
require_relative './data.rb'
require_relative './codemaker.rb'

class Codebreaker
  def initialize(length, range)
    @zahlen = [4]
    @code = Codemaker.new
    @hit = [4]
    @daten = Daten.new()
    @length = length
    @range = range
  end

  def main

    @code.generate_code(@length, @range)

    10.times {
      @daten.input(@length, @range)
      @zahlen = @daten.user_input    

      compare
      hit_output

      if (@hit.each == "black")
        puts "WIN"
        SystemExit
      end
    }

    if (@hit.each == "black")
    else
      puts "LOOOOOOOOOSER"
      puts "Der richtige code war: #{@code.code()}"
    end

  end
  
  def main_test(zahl1, zahl2, zahl3, zahl4)

    @code = [1, 2, 3, 4]
    #puts @code

    10.times {
      @zahlen[0] = zahl1
      @zahlen[1] = zahl2
      @zahlen[2] = zahl3
      @zahlen[3] = zahl4

      compare
      hit_output

      if (@hit[0] == "black" && @hit[1] == "black" && @hit[2] == "black" && @hit[3] == "black")
        puts "WIN"
        return "WIN"
        SystemExit
      end
    }

    if (@hit[0] == "black" && @hit[1] == "black" && @hit[2] == "black" && @hit[3] == "black")
    else
      puts "LOSE"
      puts "Der richtige code war: #{@code.code()}"
    end

  end

  def compare

    counter_z = [4]
    i = 0
    
    puts "#{@zahlen}"

    while i < @length
      if (@zahlen[i] == @code.code[i])
        @hit[i] = "black"
      elsif (@code.code.include?(@zahlen[i]))
        @hit[i] = "white"
      end
      i += 1
    end
    
  end

  def hit_output
    counter_white = 0
    counter_black = 0
    counter_w = [4]
    counter_b = [4]
    
    j = 0
    while j < 4
      if (@hit[j] == "black")
        counter_b.push(@zahlen[j])
        counter_black += 1
      elsif (@hit[j] == "white")
        counter_w.push(@zahlen[j])
        counter_white += 1
    end
    j = j + 1
    j=0

    while j < 4

      if (@hit[j] == "white")
        counter_white += 1
      elsif (@hit[j] == "black")
        counter_black += 1
      end

      j += 1
    end

    puts("#{counter_white}: White | #{counter_black}: Black ")
    #puts "#{@hit[0]}, #{@hit[1]}, #{@hit[2]}, #{@hit[3]}"
  end

end
end

