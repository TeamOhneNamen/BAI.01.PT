class Winter
  def create
    if @lenguage == 'en'
      @name = 'winter'
    elsif @lenguage == 'de'
      @name = "Winter"
    end
  end
end