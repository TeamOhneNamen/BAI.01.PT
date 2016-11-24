# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

# Dieses script ist das main script
# erstellt Objekt und ist für die Auswahl zuständig
require_relative "./teil"

stueckliste = Teil.new('stueckliste', 100)

eingabe = 0

while eingabe != 9

  puts "(1) - neues Objekt hinzufügen"
  puts "(2) - bestehendes Objekt löschen"
  puts "(3) - bestehendes Objekt ändern"
  puts "(4) - ausgabe des Objrkt-Baumes"

  eingabe = gets.chomp
  eingabe = eingabe.to_i

  case eingabe
  when 1
    puts "Name:"
    name = gets.chomp
    puts "Masse:"
    masse = gets.chomp
    puts "teil wozu es gehört"
    oberteil = gets.chomp

    stueckliste.neues_teil_erstellen(oberteil, name, masse)
    
  when 2
    puts "was soll gelöscht werden?"
    name = gets.chomp
    stueckliste.loeschen(name)
    
  when 3
    puts "welches Objekt soll geändert werden?"
    name = gets.chomp
    puts "Wie soll das objekt jetzt heißen?"
    new_name = gets.chomp
    puts "Welche Masse soll das Objekt jetzt haben?"
    new_masse = gets.chomp
    
    stueckliste.tauschen(name,new_name,new_masse)
    
  when 4
    puts stueckliste.ausgabe()
  end

end