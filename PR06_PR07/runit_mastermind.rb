# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './data.rb'
require_relative './codemaker.rb'
require_relative './codebreaker.rb'
require 'test/unit'

class RUnitMastermind < Test::Unit::TestCase
  def setup()
    @test_breaker_positive = Codebreaker.new(4, 4, [1, 2, 3, 4], [1, 2, 3, 4]).main
    @test_breaker_negative = Codebreaker.new(4, 4, [4, 4, 4, 4], [1, 3, 3, 3]).main
    @test_black_positive1 = Codebreaker.new(4, 4, [1, 2, 3, 4], [1, 2, 3, 4]).counter_black
    @test_black_positive2 = Codebreaker.new(4, 4, [4, 4, 4, 4], [1, 1, 1, 1]).counter_black
    
  end
  def test_breaker
    assert(@test_breaker_positive)
    assert_equal(@test_breaker_negative, false)
  end
  
  def test_black
    assert_equal(@test_black_positive1, 4)
    assert_not_equal(@test_black_positive2, 4)
  end
end