require 'test/unit'
require_relative 'teil'


class ExceptionTestTeilDeque < Test::Unit::TestCase
  
  def setup
    @wrong_designation = Teil.new(glass panel, 19.5, [])
    @wrong_weight = Teil.new("glass panel", "19.5"", [])  
  end
  def exceptions
    assert_nothing_raised ArgumentError do @wrong_designation
    assert_nothing_raised ArgumentError do @wrong_weight
  end
end