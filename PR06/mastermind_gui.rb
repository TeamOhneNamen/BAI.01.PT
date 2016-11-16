require 'tk'
require_relative './codebreaker.rb'

root = TkRoot.new
root.title = "MasterMind"
root.width = 200
root.height = 300

entry1 = TkEntry.new(root) { textvariable  $variable1 }
entry2 = TkEntry.new(root) { textvariable  $variable2 }


$variable1 = TkVariable.new
$variable2 = TkVariable.new
entry1.textvariable = $variable1
entry2.textvariable = $variable2
$variable1.value = "length"
$variable2.value = "range"

combobox = Tk::Tile::Combobox.new(root)
combobox.values = [1, 2, 3, 4]
combobox.place('height' => 25,
               'width'  => 100,
               'x'      => 10,
               'y'      => 70)
               
entry1.place('height' => 25,
            'width'  => 150,
            'x'      => 10,
            'y'      => 10)

entry2.place('height' => 25,
            'width'  => 150,
            'x'      => 10,
            'y'      => 40)
            
@entry1 = entry1.get
@enry2 = entry2.get

btn_OK = TkButton.new(root) do
  text "Play"
  borderwidth 5
  underline 0
  state "normal"
  cursor "watch"
  font TkFont.new('times 12')
  #foreground  "red"
  activebackground "blue"
  relief      "groove"
  command (proc {play})
  #pack("side" => "right",  "padx"=> "10", "pady"=> "10")
  place( 'x'      => 10,
         'y'      => 100)
end

btn_CLEAR = TkButton.new(root) do
  text "clear"
  borderwidth 5
  underline 0
  state "normal"
  cursor "watch"
  font TkFont.new('times 12')
  #foreground  "red"
  activebackground "blue"
  relief      "groove"
  command (proc {clear})
  place( 'x'      => 10,
         'y'      => 150)
end

btn_CHECK = TkButton.new(root) do
  text "check"
  borderwidth 5
  underline 0
  state "normal"
  cursor "watch"
  font TkFont.new('times 12')
  #foreground  "red"
  activebackground "blue"
  relief      "groove"
  command (proc {check})
  place( 'x'      => 10,
         'y'      => 200)
end

def play
  ans = [1, 2, 3, 4]
  sol = [1, 2, 3, 4]
  @cb = Codebreaker.new(4,4)
  #sol = $variable1.value.scan(/./)
  puts sol
  @cb.compare(sol, ans)
  @cb.hit_output()
  $variable1.value = "#{'WIN' if (@cb.win_check)}" 
end

def clear
  $variable1.value = ""
end
def check
  $variable1.value = "#{$variable1.value == "1234"}"
end
Tk.mainloop