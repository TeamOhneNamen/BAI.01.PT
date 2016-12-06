# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './pet.rb'
require_relative './human.rb'
require_relative './dog.rb'
require_relative './cat.rb'
require 'test/unit'

class RUnitMastermind < Test::Unit::TestCase
  def setup()
    @garfield = Cat.new("garfield")
    @miau = Cat.new("miau")

    
    @brutus = Human.new("brutus")
    @rex = Dog.new("Rex",@brutus)

    @john = Human.new("john")
    @sarah = Human.new("sarah")
  end

  def test_name
    assert_equal("garfield",@garfield.name_out)
  end

  def test_datum
    assert_equal("2009-04-03",@garfield.date_out)
  end

  def test_kill
    @garfield.kill(@miau)
    assert_equal(8,@miau.lifes_out)
  end

  def test_leben

    assert_equal(9,@garfield.lifes_out)
    assert_equal(1,@rex.lifes_out)

  end

  def test_human

    assert_equal("john",@john.to_s)

  end

  def test_katze_stirbt

    @garfield.kill(@miau)
    assert_equal(8,@miau.lifes_out)
    8.times{@garfield.kill(@miau)}
    assert_equal(0,@miau.lifes_out)

    assert_raise ArgumentError do
      @garfield.kill(@miau) #<-- warum nicht?
    end

  end

  def test_katze_durch_katze_verletzen

    @miau.kill(@miau)
    assert_equal(9, @miau.lifes_out)

  end

  def test_katze_bedienen

    @miau.add_staff(@john)

    @john.feed(@miau)
    assert_equal(true,@miau.feeded_out)

    @john.pet(@miau)
    assert_equal(true,@miau.petted_out)

  end

  def test_katze_bedienen

    @miau.add_staff(@john)

    assert_raise ArgumentError do
      @sarah.feed(@miau)
    end

    assert_raise ArgumentError do
      @sarah.pet(@miau)
    end

  end

  def test_hund_bedienen

    @john.feed(@rex)
    @john.pet(@rex)

    assert_equal(true,@rex.feeded_out)
    assert_equal(true,@rex.petted_out)

  end

end