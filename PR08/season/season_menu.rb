require_relative './season.rb'
require_relative './summer.rb'
require_relative './autumn.rb'
sum = Summer.instance()
sum1 = Summer.instance('de')
sum.create
puts sum
puts sum1
