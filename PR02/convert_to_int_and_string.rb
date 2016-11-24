# convertiert die Eingabe und zerlegt sie in einen String und in einen float

# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative "./convert.rb"

def convert_in_therms(input, target, tp, table)
  target = target.delete(" ")
  target = target.delete("\n")
  final = to_p(convert_float(input, target, tp, table), convert_string(input, target, tp, table), target, table)
end

def convert_float(input, target, tp, table)
  value = input.gsub(/[a-zA-Z]/) {|l|}
  value = value.delete(" ")
  value = value.delete("\n")
  value = value.to_f
  value = value * tp
end

  def convert_string(input, target, tp, table)
    measurement = input.gsub(/[0-9]/) {|l|}
    target = target.delete(" ")
    target = target.delete("\n")
    measurement = measurement.delete(" ")
    measurement = measurement.delete("\n")
    measurement = measurement.delete(".")
  end