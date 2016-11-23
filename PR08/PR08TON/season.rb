require "Singleton"
require 'thread'
class Season
  include Singleton
  def initialize()
    @lenguage = 'en'
    @name
  end
  def to_s
    @name
  end
end