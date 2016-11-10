

require_relative './codebreaker.rb'
puts "length?"
length = gets.chomp.to_i
puts "length: #{length}"
puts "range?"
range = gets.chomp.to_i
puts "range: #{range}"
cb = Codebreaker.new(length, range)
cb.main()