# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Diese Klasse dieht als Objekt
# beinhäldt alle funktionen zur verarbeitung und zur ausgabe
class Teil
  attr_accessor :name, :masse
  def initialize(name, masse)
    @name = name
    @masse = masse
    @teileliste = Array.new
  end

  def neues_teil_erstellen(oberteil, name, masse)

    if oberteil == ""
      oberteil = "stueckliste"
    end

    if @name == oberteil
      @teileliste.push(Teil.new(name, masse))
    end

    @teileliste.each { |i|
      i.neues_teil_erstellen(oberteil, name, masse)
    }

    return masse
    check = masse.kind_of?(Array)
    if check != true
      return false
    end
  end

  def tauschen(alter_name, neu_name, new_masse)
    if @name == name
      @name = neu_name
      @gewicht = new_masse
    end
    @teileliste.each { |i|
      i.tauschen(alter_name, neu_name, new_masse)
    }
  end

  def loeschen(name)

    @teileliste.each { |i|
      if i.name == name
        @teileliste.delete(i)
      end
    }

    @teileliste.each { |i|
      i.loeschen(name)
    }
  end
  
  def ausgabe(stufe=1)
    out = itself.name().to_s + " " + itself.masse.to_s + "\n"
    @teileliste.each{ |i|
      out += ('--')*stufe + "> " + i.ausgabe(stufe+1)
    }
    out
  end
end