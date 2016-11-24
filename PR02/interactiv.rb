# Diese Datei diehnt der Begruessung und dem Zuweisen von value und target mit Werten

# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative "./convert_to_int_and_string.rb"
require_relative "./table.rb"

class Interactiv
  def initialize()
    @value_measurement
    @jn
  end

  attr_accessor :value
  attr_accessor :jn

  def interaction_begruessung
    @schrittweite = 0

    puts "Hertzlich Wilkommen."
    puts "Dieses Programm wird ihnen dabei helfen werte in andere Werte zu rechnen!"
    puts "Geben sie dazu Bitte Folgendes ein:"
    puts "Wert mit Einheit"
    value_measurement=(gets)
    # puts "Ihre Eingabe war: #{value_measurement}"
    puts "In welche Einheit soll es Umgewandelt werden?"
    target=(gets)
    target = target.delete " \n"
    puts "Wollen sie eine Wertetabelle dazu? j/n"
    jn=(gets)
    jn = jn.delete " \n"

    if jn == "j"
      puts "Welche Schrittweite?"
      @schrittweite =gets.chomp.to_i
      puts "Welcher Endwert?"
      @endwert = gets.chomp.to_i
      puts "Welche zweite Masseinheit für die Tabelle"
      target2 = gets.chomp
      puts "Welche dritte Masseinheit für die Tabelle"
      target3 = gets.chomp
      @schritt = 0
    end

    if jn == "n"
      puts "#{convert_float(value_measurement, target, 1, jn)} #{convert_string(value_measurement, target, 1, jn)} =  #{convert_in_therms(value_measurement, target, 1, jn)} #{target}"
    end
  end

  def begruessung(value_measurement, target, jn, schrittweite, endwert, target2, target3)
    @schrittweite = 0
    if jn == "j"
      table(value_measurement, target, jn, schrittweite, endwert, target2, target3)
    end
    if jn == "n"
      puts "#{convert_float(value_measurement, target, 1, jn)} #{convert_string(value_measurement, target, 1, jn)} =  #{convert_in_therms(value_measurement, target, 1, jn)} #{target}"
    end
  end
end