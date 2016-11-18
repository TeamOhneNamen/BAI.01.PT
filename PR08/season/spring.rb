require_relative './season.rb'
class Spring < Season
  def create(lenguage = @lenguage)
    if @lenguage == 'en'
      @name = 'spring'
    elsif @lenguage == 'de'
      @name = "Frühling"
    end
  end
end