# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

class Season
  @@spring = nil
  @@summer = nil
  @@winter = nil
  @@authumn = nil
  def initialize(name = "season")
    @name = name
  end

  def create_spring(spra)
    if @@spring == nil
      if spra == "de"
        @@spring = Season.new("Frühling")
      elsif spra == "eng"
        @@spring = Season.new("Spring")
      end
    else
      raise StandardError, "es kann nur einen \'spring\' geben!"
    end
  end

  def create_summer(spra)
    if @@summer == nil
      if spra == "de"
        @@summer = Season.new("Sommer")
      elsif spra == "eng"
        @@summer = Season.new("Summer")
      end
    else
      raise StandardError, "es kann nur einen \'summer\' geben!"
    end
  end

  def create_winter(spra)
    if @@winter == nil
      if spra == "de"
        @@winter = Season.new("Winter")
      elsif spra == "eng"
        @@winter = Season.new("Winter")
      end
    else
      raise StandardError, "es kann nur einen \'winter\' geben!"
    end
  end

  def create_autumn(spra)
    if @@authumn == nil
      if spra == "de"
        @@authumn = Season.new("Herbst")
      elsif spra == "eng"
        @@authumn = Season.new("Authumn")
      end
    else
      raise StandardError, "es kann nur einen \'authumn\' geben!"
    end
  end

  def _dump
    raise StandardError, "illeale Methode!"
  end

  def name
    @name
  end

end

season = Season.new()
frühling = season.create_spring("de")
puts frühling.name()
sommer = season.create_summer("de")
puts sommer.name()
authumn = season.create_autumn("eng")
puts authumn.name()
winter = season.create_winter("de")
puts winter.name()