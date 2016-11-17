require_relative './season.rb'
class Summer < Season
  def create
    if @lenguage == 'en'
      @name = 'summer'
    elsif @lenguage == 'de'
      @name = "Sommer"
    end
  end
end
