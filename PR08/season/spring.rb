require_relative './season.rb'
class Spring < Season
  def create
    if @lenguage == 'en'
      @name = 'spring'
    elsif @lenguage == 'de'
      @name = "Frühling"
    end
  end
end