require "Singleton"
require 'thread'
class Season
  include Singleton #da mit es jede Jahreszeit nur ein mal gibt
  def initialize()
    @lenguage = 'en' #falls der Benutzer, die Sprache nicht festlegt, ist sie default englisch
    @name
  end
  def to_s
    @name
  end
end