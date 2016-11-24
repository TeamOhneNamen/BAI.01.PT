# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker
require_relative './numerik.rb'
require 'test/unit'
class RUnitNumerik < Test::Unit::TestCase
  def setup()
    @n     = Numerik.new()
    @d_2   = 2.0
    @d_5   = 5.0
    @i_1k = 1000
  end
  
  def test_es_gilt
    assert_equal(2.0, @n.es_gilt_inject)
    assert_equal(2.0, @n.es_gilt_reduce)
  end
  
  def test_iterative
    assert_in_delta(Math.log(@d_2), @n.solve_iterative(@d_2, @i_1k), 0.001)
    assert_raises ArgumentError do |r|
    (@n.solve_iterative(@d_5, @i_1k))
    end
  end
  
  def test_recursive
    assert_in_delta(Math.log(@d_2), @n.solve_recursive(@d_2, @i_1k), 0.001)
    assert_raises ArgumentError do |r|
    (@n.solve_recursive(@d_5, @i_1k))
    end
  end
end