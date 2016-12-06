# Author:: Laura Westfalen
# Author:: Lukas Stermann

require 'test/unit'
require_relative 'teil'


class TeilTest < Test::Unit::TestCase
  
  def setup
    @glass_panel_door1 = Teil.new("glass panel", 19.5, [])
    @doorframe_door1 = Teil.new("doorframe", 70.0, [])
    @doorknob_door1 = Teil.new("doorknob", 0.5, [])
    @glass_panel_door2 = Teil.new("glass panel", 19.5, [])
    @doorframe_door2 = Teil.new("doorframe", 70.0, [])
    @doorknob_door2 = Teil.new("doorknob", 0.5, [])
    @glass_panel_back_door = Teil.new("glass panel", 69.5, [])
    @doorframe_back_door = Teil.new("doorframe", 110.0, [])
    @wiper = Teil.new("wiper", 0.5, [])
    
    @door1_bom = [@glass_panel_door1, @doorframe_door1, @doorknob_door1]
    @door1 = Teil.new("door", 90.0, @door1_bom)
    @door2_bom = [@glass_panel_door2, @doorframe_door2, @doorknob_door2]
    @door2 = Teil.new("door", 90.0, @door2_bom)
    @back_door_bom = [@glass_panel_back_door, @doorframe_back_door, @wiper]
    @back_door = Teil.new("back door", 180.0, @back_door_bom)
    @cover = Teil.new("door cover", 305.0, [])
      
    @coachwork_bom = [@door1, @door2, @back_door, @cover]
    @coachwork = Teil.new("coachwork",150.0, @coachwork_bom)
    
    @vw_beetle = Teil.new("beetle",1500,[])
      
    @other_car = Teil.new("car",10.5,[])
      
    @wrong_designation = Teil.new(glass panel, 19.5, [])
    @wrong_weight = Teil.new("glass panel", "19.5", [])
    @correct_types = Teil.new("glass panel", 19.5, [])   
  end

# The following are positive RUnit tests

# Are the following objects objects of class Teil? We show that our class implementation worked out.
  def test_objects
    assert_kind_of(Teil, @cover)
    assert_kind_of(Teil, @coachwork)
    assert_kind_of(Teil, @back_door)
  end
  
# Do the methods .add_parent and .get_parent work? 
# We add a parent. Then we ask if the added parent really is the parent of the object. 
  def test_parenthood
    @coachwork.add_parent(@vw_beetle)
    assert_equal(@vw_beetle, @coachwork.get_parent)
    
    @glass_panel_door1.add_parent(@vw_beetle)
    assert_equal(@vw_beetle, @glass_panel_door1.get_parent)
    
    @doorknob_door1.add_parent(@wiper)
    assert_equal(@wiper, @doorknob_door1.get_parent)
  end
  
# Do the methods .get_child and .add_child work?
# We add a child. Then we ask if the added child really is the child of the object.
  def test_childhood
    assert_empty(@vw_beetle.get_child)
    @vw_beetle.add_child(@door1)
    refute_empty(@vw_beetle.get_child)
    assert_equal(@door1, @vw_beetle.get_child[0])
    
    assert_empty(@wiper.get_child)
    @wiper.add_child(@door2)
    refute_empty(@wiper.get_child)
    assert_equal(@door2, @wiper.get_child[0])
  end
  
# Does the method .delete_child work?
# We add a child to an object without children, we ask, if that worked out, 
# then we delete the child again and ask if the list of children is empty again  
  def test_deleted_children
    @vw_beetle.add_child(@door1)
    assert_equal(@door1, @vw_beetle.get_child[0])
    @vw_beetle.delete_child(@door1)
    assert_empty(@vw_beetle.get_child)
    
    @wiper.add_child(@door2)
    assert_equal(@door2, @wiper.get_child[0])
    @wiper.delete_child(@door2)
    assert_empty(@wiper.get_child)
    
    @doorknob_door2.add_child(@cover)
    assert_equal(@cover, @doorknob_door2.get_child[0])
    @doorknob_door2.delete_child(@cover)
    assert_empty(@doorknob_door2.get_child)
  end
    
# Does the method .swap_child work?
# We exchange an object with another object. Afterwards we ask whether the attributes 
# of the objects are equal. 
  def test_swap
    @back_door.swap_child(@door1)
    assert_equal(@back_door.get_child, @door1.get_child)
    assert_equal(@back_door.get_parent, @door1.get_parent)
    assert_equal(@back_door.designation, @door1.designation)
    assert_equal(@back_door.weight, @door1.weight)
    
    @doorknob_door2.swap_child(@vw_beetle)
    assert_equal(@doorknob_door2.get_child, @vw_beetle.get_child)
    assert_equal(@doorknob_door2.get_parent, @vw_beetle.get_parent)
    assert_equal(@doorknob_door2.designation, @vw_beetle.designation)
    assert_equal(@doorknob_door2.weight, @vw_beetle.weight)
    
    @coachwork.swap_child(@vw_beetle)
    assert_equal(@coachwork.get_child, @vw_beetle.get_child)
    assert_equal(@coachwork.get_parent, @vw_beetle.get_parent)
    assert_equal(@coachwork.designation, @vw_beetle.designation)
    assert_equal(@coachwork.weight, @vw_beetle.weight)      
  end
  
# Does the method .get_top work?
# We add a parent(without own parents) to an object. In doing so we can apply .get_top to this object
# and expect to retrieve the added parent.
  def test_top # Hier muss noch das top Teil selbst getestet werden
    @cover.add_parent(@other_car)
    assert_equal(@other_car, @cover.get_top)
    
    @coachwork.add_parent(@other_car)
    assert_equal(@other_car, @coachwork.get_top)
    
    @doorframe_back_door.add_parent(@vw_beetle)
    assert_equal(@vw_beetle, @doorframe_back_door.get_top)
  end

# The following are negative RUnit tests
# Noch nicht. Hier müssen Fehler erzeugt werden.
  
# Now, we try .get_child without the method .add_child --> we expect a negative outcome. 
# Thereby we show, that the .add_child method is necessary.    
  def test_neg_child
    refute_empty(@coachwork.get_child)
    refute_empty(@door1.get_child)
    refute_empty(@door2.get_child)
  end

# We try .get_parent without the method .add_parent --> we expect a negative outcome. 
# Thereby we show, that the .add_parent method is necessary.    
  def test_parenthood_negative
    refute_equal(@vw_beetle, @door1.get_parent)
    refute_equal(@vw_beetle, @glass_panel_door1.get_parent)
    refute_equal(@wiper, @doorknob_door1.get_parent)
  end
  
def test_exceptions
  assert_nothing_raised ArgumentError do @wrong_designation
  assert_nothing_raised ArgumentError do @wrong_weight
end  
  
# The following are limit case RUnit tests???

end