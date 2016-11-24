# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# objekt Deque und dessen methoden
class Deque
  def initialize(array)
    @daten = array
  end

  def get_daten
    @daten.clone
    # aus sicherheit wird hier ein clone von @daten
    # zurrückdedeben
  end

  def enqueue(element)
    @daten << element
    return nil
    # ich gebe nil zurück, weil ich nichts brauche
    # weil ich sonst die refferenz für @daten
    # zurrückgeben würde(sicherer)
  end

  def dequeue
    @daten.delete_at(0)
    # dar delete ein Item oder nil zurückgibt
    # ist es nicht weiter tragisch
  end

  alias_method :push, :enqueue

  def pop
    ende = @daten.length
    @daten.delete_at(ende-1)
    # dar delete ein Item oder nil zurückgibt
    # ist es nicht weiter tragisch
  end
end