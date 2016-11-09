# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Diese Klasse enthält die logik zum Lösen des Codes
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
    #puts @code

    10.times {
      @daten.input
      @zahlen[0] = @daten.z1
      @zahlen[1] = @daten.z2
      @zahlen[2] = @daten.z3
      @zahlen[3] = @daten.z4

      vergleichen

      if (@hit[0] == "black" && @hit[1] == "black" && @hit[2] == "black" && @hit[3] == "black")
        puts "WIN"
        SystemExit
      end
    }

    if (@hit[0] == "black" && @hit[1] == "black" && @hit[2] == "black" && @hit[3] == "black")
    else
      puts "LOSE"
      puts "Der richtige code war: #{@code.code()}"
    end

  end

  def vergleichen

    counter_z = [4]
    i = 0

    puts "#{@zahlen[0]}, #{@zahlen[1]}, #{@zahlen[2]}, #{@zahlen[3]}"
    while i < 4
      if (@zahlen[i] == @code.code[i])
        @hit[i] = "black"
      elsif (@code.code.include?(@zahlen[i]))
        @hit[i] = "white"
      end

      i += 1
    end

    counter_white = 0
    counter_black = 0
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

breakthecode = Codebreaker.new()
breakthecode.main()