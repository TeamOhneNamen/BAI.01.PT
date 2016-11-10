# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Diese Klasse enthält die logik zum Lösen des Codes
require_relative './data.rb'
require_relative './codemaker.rb'

class Codebreaker
  def initialize(length, range)
    @zahlen = [@length]
    @code = Codemaker.new
    @hit = [@length]
    @daten = Daten.new()
    @length = length
    @range = range
  end

  def main

    @code.generate_code(@length, @range)

    10.times {
      @daten.input(@length, @range)
      @zahlen = @daten.user_input    

      compare(@zahlen, @code.code)
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
  
  
  def compare(answer, solution)

    counter_z = [@length]
    i = 0
    
    puts "#{@zahlen}"

    while i < @length
      if (answer[i] == solution[i])
        @hit[i] = "black"
      elsif (solution.include?(@zahlen[i]))
        @hit[i] = "white"
      end
      i += 1
    end
    
  end

  def hit_output
    counter_white = 0
    counter_black = 0
    counter_w = [@length]
    counter_b = [@length]
    
    j = 0
    while j < @length
      if (@hit[j] == "black")
        counter_b.push(@zahlen[j])
        j = j + 1
      elsif (@hit[j] == "white")
        counter_w.push(@zahlen[j])
        j = j + 1
        break
      else
      j = j + 1
      end
    end
    i=0
    @hit.length.times{
      counter_black += 1 if (@hit[i] == "black")
      counter_white += 1 if (@hit[i] == "white") 
      i += 1
    }
    puts("#{counter_white}: White | #{counter_black}: Black ")
    #puts "#{@code}"
    #puts "#{@hit}"
  end

end

