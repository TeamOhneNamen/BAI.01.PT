# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './data.rb'
require_relative './codemaker.rb'
require_relative './codebreaker.rb'
require 'test/unit'

class RUnitMastermind < Test::Unit::TestCase
  def setup()
    @test_data = Data.new
    @to_high = @test_data.input_test(1, 2, 3, 5)
    @to_low = @test_data.input_test(0, 2, 3, 4)
    @accepted = @test_data.input_test(1, 2, 3, 4)
    
    @test_breaker = Codebreaker.new
    @win = @test_breaker.main_test(1, 2, 3, 4)
    @lose = @test_breaker.main_test(4, 2, 3, 4)
    
  end
  
  
  def test_data
    assert_raise(@to_low)
    assert_raise(@to_high)
    assert_nothing_raised(@accepted)
  end
  def test_breaker
    assert_equal(@win, "WIN")
    assert_not_equal(@lose, "WIN")
  end
end