require_relative './knuth.rb'
game = Game.new
#game.create_code
game.game_type

i = 0
wincount = 0
winyn = false
while j < @hit.length
  if (@hit[i] == 'black')
      wincount += 1
  end
  winyn = wincount == @hit.length  
end