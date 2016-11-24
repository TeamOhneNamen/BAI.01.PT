# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative './teil.rb'
require 'test/unit'


class TestTeile < Test::Unit::TestCase
  def setup()
    @a = teil.new
    @b = "0"
    @c = 0
  end

  def test_grenzfaelle
    #Grenzfalltest wäre zum Beispiel ob auch eine Stückliste erstellt werden kann ohne ein Objekt,
    #nein geht vom Programmaufbau her nicht
  end

  def test_positiv
    #prüft zunächst ob er erfolgreich rechnet (also kann nicht nil herauskommt)
    assert_not_nil(!@a.neues_teil_erstellen("", @b, @c).nil?)
    assert_match(@a.neues_teil_erstellen("", @b, @c), @c)
  end

  def test_negativ
    #gibt für Masse String ein, erwartet false
    assert_false(@a.neues_teil_erstellen("", @b, @b).false?)
  end

end

#asser_kind_of(Teil, @cover) ist cover ein Typ Teil
#negativtest müssen fehler haben