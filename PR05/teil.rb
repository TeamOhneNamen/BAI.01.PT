# Author:: Laura Westfalen
# Author:: Lukas Stermann

class Teil

  def initialize (designation, weight, materials)
    @designation = designation
    if (@designation.instance_of?(String))
    else
      raise ArgumentError, "designation should be a STRING"
    end
    @weight = weight.to_f # in kg
    
    if (@weight.instance_of?(Float))
    else 
      raise ArgumentError, "weight should be a NUMBER"
    end
    
    if (@weight.nil? || @designation.nil?)
      raise ArgumentError, "designation or weight are NIL"
    end
    
    @bill_of_materials = []
    if materials.is_a?(Array)
      materials.each do |m|
        if m.is_a?(Teil)
          self.add_child(m);
        end
      end
    end
    @parent = nil
  end

  attr_accessor :designation, :weight

  def get_parent # Hier würde attr_reader auch gehen.
    return @parent
  end

  def get_child # Umbenennen in get_children
    return @bill_of_materials.clone
  end

  def add_parent(parent) # Child muss hier auch eingebaut werden, genau wie ein Test dafür # parent is the object on the lower level, we connect them here
    @parent = parent
  end

  def add_child(child) # here you can add an object to the BOM, this is a changing method
    child.add_parent(self)
    @bill_of_materials.push(child)
    return child
  end

  def delete_child(child) # this is a changing method that delets a child object
    @bill_of_materials.delete(child)
  end

  def swap_child(object) # this is a changing method, that swaps objects #bezeichnung zu swap_self<- wort ungünstig?
    @designation = object.designation
    @weight = object.weight
    @bill_of_materials = object.get_child
    @parent = object.get_parent
  end

  def to_get_teile
    @designation.to_s
  end

  def get_teile # prints out the child objects of an object
    puts "Components: "
    @bill_of_materials.each do |material|
      print material.to_get_teile + " "
    end
  end

  def to_s
    "The weight of #{@designation} is #{@weight}kg."
  end

  def get_top # is looking for the top level object
    papa = self
    while papa.get_parent != nil
      papa = papa.get_parent
    end
    return papa
  end

  def deep_to_s # prints out every child object of each higher levels
    puts @designation + ": \n"
    @bill_of_materials.each do |material|
      print material.to_get_teile + " "
    end
    puts "\n"
    kind = self.get_child
    if kind != nil
      kind.each do |mat|
        mat.deep_to_s
      end
    end
  end

  def each # hands over a block of Rubycode to the child objects
    kind = self.get_child
    if kind != nil
      kind.each do |mat|
        yield
      end
    end
  end
  
  def == (other)
    @designation == other.designation
    @weight == other.weight
    @parent == other.parent
    @bill_of_materials == other.bill_of_materials
  end
end