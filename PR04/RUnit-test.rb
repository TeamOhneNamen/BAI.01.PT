# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Testet die mehthoden 
require_relative './deque.rb'
require 'test/unit'

class Testen < Test::Unit::TestCase
  def setup()

    @deque = Deque.new(['1','2','3','4','5','6','7','8'])
    @g1 = ''
    @g2 = 1.32547465634646836725623454868
    @g3 = '2'
    @g4 = '3'
    @g5 = '9'
    @g6 = '10'
    @g7 = '7'
    @g8 = '6'

  end
  
  # teste obe die enqueue methode funktioniert
  def test_grenzfaelle_enqueue

    @deque.enqueue(@g1)
    assert_equal(@g1, @deque.get_daten[8])
    @deque.enqueue(@g2)
    assert_equal(@g2, @deque.get_daten[9])

  end

  # teste obe die dequeue methode funktioniert
  def test_grenzfaelle_dequeue

    @deque.dequeue()
    assert_equal(@g3, @deque.get_daten[0])
    @deque.dequeue()
    assert_equal(@g4, @deque.get_daten[0])

  end

  # teste obe die push methode funktioniert
  def test_grenzfaelle_push

    @deque.push(@g5)
    assert_equal(@g5, @deque.get_daten[8])
    @deque.push(@g6)
    assert_equal(@g6, @deque.get_daten[9])

  end

  # teste obe die pop methode funktioniert
  def test_grenzfaelle_pop

    @deque.pop()
    assert_equal(@g7, @deque.get_daten[6])
    @deque.pop()
    assert_equal(@g8, @deque.get_daten[5])

  end

  
  # teste was passeirt, wenn öfter das letzte element 
  # gelöscht wird, als es elemente in dem Array gibt
  def test_alles_loeschen

    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.pop()
    @deque.push(@g1)
    assert_equal(@g1, @deque.get_daten[0])

  end

end