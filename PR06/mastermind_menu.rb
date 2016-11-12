require_relative './codebreaker.rb'
require_relative './knuth.rb'
puts "length?"
length = gets.chomp.to_i
puts "length: #{length}"
puts "range?"
range = gets.chomp.to_i
puts "range: #{range}"
puts "create or guess"
#knuth = Game.new(length, range)
#knuth.fast_knuth
#knuth.possibilities_set
game = gets.chomp
if game == "c"
  knuth = Game.new(length, range)
  knuth.fast_knuth
  knuth.possibilities_set
elsif game == "g"
  cb = Codebreaker.new(length, range)
  cb.main()
end
