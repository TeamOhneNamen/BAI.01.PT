require "Singleton"
require 'thread'
class Season
  include Singleton
  def initialize(lenguage = "en")
    @lenguage = lenguage
    @name
  end
  def to_s
    @name
  end
  def self.instance(lenguage = "en") # :nodoc:
    @lenguage = lenguage
    return @singleton__instance__ if @singleton__instance__
    @singleton__mutex__.synchronize {
      return @singleton__instance__ if @singleton__instance__
      @singleton__instance__ = new()
    }
    @singleton__instance__
  end
end