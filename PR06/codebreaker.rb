# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Diese Klasse enthält die logik zum Lösen des Codes
require_relative './data.rb'
require_relative './codemaker.rb'

class Codebreaker
  def initialize(length, range, code_solution = [])
    @zahlen = [@length]
    @code = Codemaker.new
    @hit = []
    @daten = Daten.new()
    @length = length
    @range = range
    @code_solution = code_solution
  end

  def main
    if (@code_solution.empty?)
      @code.generate_code(@length, @range)
      @code_solution = @code.code
    end

    10.times {
      @daten.input(@length, @range)
      @zahlen = @daten.user_input    

      compare(@zahlen, @code_solution)
      hit_output
      if (win_check)
        break
      end
    }

    if (win_check)
      puts "WIN"
    else
      puts "LOOOOOOOOOSER"
      puts "Der richtige code war: #{@code_solution}"
    end

  end
  
  
  def compare(answer, solution)

    counter_z = [@length]
    i = 0
    
    puts "#{@zahlen}"

    while i < @length
      if (answer[i] == solution[i])
        @hit.push("black")
      elsif (solution.include?(@zahlen[i]))
        @hit.push("white")
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

  def win_check
    i = 0
    wincount = 0
    winyn = false
    while i < @hit.length
      if (@hit[i] == 'black')
          wincount += 1
      end
      i += 1 
      winyn = wincount == @hit.length
      return winyn
    end
  end
end

