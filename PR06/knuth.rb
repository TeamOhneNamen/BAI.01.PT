# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './data.rb'
require_relative './codemaker.rb'
require_relative './codebreaker.rb'
require "benchmark"

class Game
  attr_accessor :attempt, :type
  def initialize
    @attempt = 1
    @type = type
    @daten = Daten.new
    @cm = Codemaker.new
    @cb = Codebreaker.new(4, 4)
  end

  def create_code
    @cm.generate_code
    @code = []
    @code = @cm.code.join
    puts @code
  end

  def input_code
    @user_input = @daten.input(4, 4).join
  end


  def verify_input(input, code = @code)
    red_pins = 0
    white_pins = 0

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
    @all_possibilities = (1..6).to_a.repeated_permutation(4).to_a.join.scan(/.{4}/)# 4 = length, 6 = range
  end
  def s_list
    @s = (1..6).to_a.repeated_permutation(4).to_a.join.scan(/.{4}/) 
  end
  def pin_possibilities
    @all_pin_possibilities = (0..4).to_a.repeated_permutation(2).to_a.map { |x| x if x[0]+x[1] <= 4 }.compact 
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
    while @code == nil
    input_code
    @code = @user_input
    end

    possibilities_set 
    s_list 
    pin_possibilities 

    remove_wrong_guesses("1122")
    @attempt -= 1
    print "#{@attempt}: 1122 - #{verify_input("1122")}\n"
    while @s.length > 1
      remove_wrong_guesses(fast_score_guesses)
      print "#{@attempt}: #{@guessed_attempt} - #{verify_input(@guessed_attempt)}; guessed in #{@time.round(6)} ms\n"
      if @s.length == 1
      print "#{@attempt+1}: #{@s[0]} - #{verify_input(@s[0])}\n"
      return "secret code #{@s}, guessed in #{@attempt} moves."
      end
    end
  end

  def game_type
    print 'do you want to "guess" or "create" a code? '
    while @type == nil
    @type = gets.chomp
    if @type == "guess"
      @cb.main()
    elsif @type == "create"
      fast_knuth
    else 
      'wrong type, choose either "guess" or "create".'
      @type = nil
    end
    end 
  end

  
end

#my_game = Game.new
#my_game.game_type