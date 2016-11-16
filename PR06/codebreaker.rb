# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Diese Klasse enthält die logik zum Lösen des Codes
require_relative './data.rb'
require_relative './codemaker.rb'

class Codebreaker
  def initialize(length, range, code_answer = [],code_solution = [])
    @code_answer = [@length]
    @code = Codemaker.new
    @hit = []
    @daten = Daten.new()
    @length = length
    @range = range
    @code_answer = code_answer
    @code_solution = code_solution
  end

  def main
    if (@code_solution.empty?)
      @code.generate_code(@length, @range)
      @code_solution = @code.code
    end
    
    if (@code_answer.empty?)
      10.times {
        @daten.input(@length, @range)
        @code_answer = @daten.user_input    

        if (evaluation)
          break
        end
        }
    end

    if (evaluation)
      return true
    else
      puts "LOOOOOOOOOSER"
      puts "Der richtige code war: #{@code_solution}"
    end
    @counter_black == @hit.length
  end
  
  def compare(answer, solution)
    counter_z = [@length]
    i = 0
    
    puts "#{@code_answer}"

    while i < @length
      if (answer[i] == solution[i])
        @hit.push("black")
      elsif (solution.include?(@code_answer[i]))
        @hit.push("white")
      end
      i += 1
    end
  end

  def hit_output
    @counter_white = 0
    @counter_black = 0
    @counter_w = [@length]
    @counter_b = [@length]
    
    j = 0
    while j < @length
      if (@hit[j] == "black")
        @counter_b.push(@code_answer[j])
        j = j + 1
      elsif (@hit[j] == "white")
        @counter_w.push(@code_answer[j])
        j = j + 1
        break
      else
      j = j + 1
      end
    end
    i=0
    @hit.length.times{
      @counter_black += 1 if (@hit[i] == "black")
      @counter_white += 1 if (@hit[i] == "white") 
      i += 1
    }
    puts("#{@counter_white}: White | #{@counter_black}: Black ")
  end

  
  def evaluation
    compare(@code_answer, @code_solution)
    hit_output
    if (@counter_black == @hit.length)
      puts "WIN"
    end
    @counter_black == @hit.length
  end
  
  def counter_black
    @counter_black
  end
end

