require_relative './codebreaker.rb'
require_relative './knuth.rb'
cb = Codebreaker.new(4, 4, [1, 2, 3, 4], [1, 2, 3, 4])
cb.main
cbf = Codebreaker.new(4, 4, [1, 4, 4, 4], [1, 2, 3, 4])
puts cbf.evaluation
puts cbf.counter_black