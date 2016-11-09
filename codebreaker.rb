require_relative './data.rb'
require_relative './codemaker.rb'

class Codebreaker
  def initialize()
    @zahlen = [4]
    @code = Codemaker.new()
    @hit = [4]
    @daten = Daten.new()
  end

  def main

    @code.generate_code()
    puts @code

    10.times {
      @daten.input
      @zahlen[0] = @daten.z1
      @zahlen[1] = @daten.z2
      @zahlen[2] = @daten.z3
      @zahlen[3] = @daten.z4

      compare
      hit_output

      if (@hit[0] == "black" && @hit[1] == "black" && @hit[2] == "black" && @hit[3] == "black")
        puts "WIN"
        SystemExit
      end
    }

    if (@hit[0] == "black" && @hit[1] == "black" && @hit[2] == "black" && @hit[3] == "black")
    else
      puts "LOSE"
    end

  end

  def compare

    counter_z = [4]
    i = 0

    puts "#{@zahlen[0]}, #{@zahlen[1]}, #{@zahlen[2]}, #{@zahlen[3]}"
    while i < 4
      if (@code.code.include?(@zahlen[i]))
        @hit[i] = "white"
      end
      if (@zahlen[i] == @code.code[i])
        @hit[i] = "black"
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
    end
    puts("#{counter_white}: White | #{counter_black}: Black ")
    #puts "#{@hit[0]}, #{@hit[1]}, #{@hit[2]}, #{@hit[3]}"
  end

end

breakthecode = Codebreaker.new()
breakthecode.main()