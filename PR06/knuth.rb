# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './data.rb'
require_relative './codemaker.rb'
require_relative './codebreaker.rb'
require "benchmark"

class Game
  attr_accessor :attempt, :type
  def initialize(length, range)
    @attempt = 1
    @type = type
    @daten = Daten.new
    @cm = Codemaker.new
    @length = length
    @range = range
    @cb = Codebreaker.new(length, range)
  end

  def create_code
    @cm.generate_code
    @code = []
    @code = @cm.code.join
    puts @code
  end

  def verify_input(input, code_in = @code) #, code = @code
    code = ''
    #code = @code
    code = code_in.to_s
    red_pins = 0
    white_pins = 0
    
    full_matches = []

    input = input.split('').map(&:to_i) 
    code = code.split('').map(&:to_i)

    # find red pins:
    full_matches = input.zip(code).map {|x, y| y-x} 
    red_pins = full_matches.count(0) 

    #find white pins:
    partial_matches = (input & code).flat_map { |n| [n]*[input.count(n), code.count(n)].min } 
    white_pins = partial_matches.length - red_pins 
    return [red_pins, white_pins]
  end

  def possibilities_set
    #creates an array with all possible combinations @all_possibilities
    length_array = []
    @length.times{length_array.push(".")}
    @length_dot = length_array.join
    @all_possibilities = (1..@range).to_a.repeated_permutation(@length).to_a.join.scan(/#{@length_dot}/)
  end
  def s_list
    @s = (1..@range).to_a.repeated_permutation(@length).to_a.join.scan(/#{@length_dot}/)
  end
  def pin_possibilities
    @all_pin_possibilities = (0..@length).to_a.repeated_permutation(2).to_a.map { |x| x if x[0]+x[1] <= @length }.compact 
  end

  def remove_wrong_guesses(guess)
    @s.map! {|temp_guess| verify_input(temp_guess, guess) == verify_input(guess) ? temp_guess : nil}.compact!
    @attempt += 1
    @s 
  end

  def score_guesses
    scores = {}
    temp_score = []
    @all_possibilities.each do |possibility|
      @all_pin_possibilities.each do |pin_possibility|
        new_s = @s.map {|temp_guess| verify_input(temp_guess, possibility) == pin_possibility ? temp_guess : nil}.compact 
        temp_score << @s.length-new_s.length 
      end
        scores[possibility] = temp_score.min
        temp_score = []
    end
    scores.sort_by { |key, value| value }[-1][0] # => 
  end

  def fast_score_guesses
    scores = {}
    temp_score = []

    @time = Benchmark.realtime do
    (1..10000).each { |i| i }

      @s.each do |possibility|
        @all_pin_possibilities.each do |pin_possibility|
          new_s = @s.map {|temp_guess| verify_input(temp_guess, possibility) == pin_possibility ? temp_guess : nil}.compact 
          temp_score << @s.length-new_s.length 
        end
        scores[possibility] = temp_score.min
        temp_score = []
      end

    end
    @guessed_attempt = scores.sort_by { |key, value| value }[-1][0] # => 
  end 

  def fast_knuth
    @code = @daten.input(@length, @range).join
    puts "input #{@code}"
    possibilities_set 
    s_list 
    pin_possibilities 
    
    first_guess_array = []
    first_guess = 0
    @length.times{first_guess_array.push(Random.rand(1..@range))}
    puts first_guess_array.join
    first_guess = first_guess_array.join
    
    remove_wrong_guesses("#{first_guess}")
    @attempt -= 1
    print "#{@attempt}: #{first_guess} - #{verify_input("#{first_guess}")}\n"
    while @s.length > 1
      remove_wrong_guesses(fast_score_guesses)
      print "#{@attempt}: #{@guessed_attempt} - #{verify_input(@guessed_attempt)}; guessed in #{@time.round(6)} ms\n"
      if @s.length == 1
      print "#{@attempt+1}: #{@s[0]} - #{verify_input(@s[0])}\n"
      return "secret code #{@s}, guessed in #{@attempt} moves."
      end
    end
  end  
end