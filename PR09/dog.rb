# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

class Dog
  def initialize(name, owner, race = "dog", lifes = 1)
    create(name, owner = nil, race, lifes)
  end
end