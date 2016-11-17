require_relative './season.rb'
class Autumn < Season
  def create
    if @lenguage == 'en'
      @name = 'autumn'
    elsif @lenguage == 'de'
      @name = "Herbst"
    end
  end
end
