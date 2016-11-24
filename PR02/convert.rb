# rechnet erst werte in p und dann in target

# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

require_relative "./interactiv.rb"

def to_p(value, measurement, target, table)

  if measurement == "mm"
    value_p = value * 2.2633484517438173216473
  elsif measurement == "cm"
    value_p = value * 22.633484517438173216473
  elsif measurement == "m"
    value_p = value * 2263.3484517438173216473
  elsif measurement == "km"
    value_p = value * 2263348.4517438173216473

  elsif measurement == "ft"
    value_p = value * 689.86858601572076713503249167896
  elsif measurement == "mile"
    value_p = value * 3642507.3776275644045945176070335
  elsif measurement == "in"
    value_p = value * 57.489019630222359649767209125707
    
  elsif measurement == "fp"
    value_p = value * 0.000001
  elsif measurement == "mp"
    value_p = value * 0.001
  elsif measurement == "cp"
    value_p = value * 0.01
  elsif measurement == "dp"
    value_p = value * 0.1
  elsif measurement == "Dp"
    value_p = value * 10.0
  elsif measurement == "Hp"
    value_p = value * 100.0
  elsif measurement == "Kp"
    value_p = value * 1000.0
  elsif measurement == "Fp"
    value_p = value * 1000000.0
  elsif measurement == "p"
    value_p = value
  end
  
  convert(target, value_p, value, measurement, table)
end

def convert(target, p, value, measurement, table)

  new_value = 0

  if target == "mm"
    new_value = p / 2.2633484517438173216473
  elsif target == "cm"
    new_value = p / 22.633484517438173216473
  elsif target == "m"
    new_value = p / 2263.3484517438173216473
  elsif target == "km"
    new_value = p / 2263348.4517438173216473
  elsif target == "p"
    new_value = p

  elsif target == "ft"
    new_value = p / 689.86858601572076713503249167896
  elsif target == "mile" 
    new_value = p / 3642507.3776275644045945176070335
  elsif target == "in"
    new_value = p / 57.489019630222359649767209125707
  
  elsif target == "fp"
    new_value = p / 0.000001
  elsif target == "mp"
    new_value = p / 0.001
  elsif target == "cp"
    new_value = p / 0.01
  elsif target == "dp"
    new_value = p / 0.1
  elsif target == "Dp"
    new_value = p / 10.0
  elsif target == "Hp"
    new_value = p / 100.0
  elsif target == "Kp"
    new_value = p / 1000.0
  elsif target == "Fp"
    new_value = p / 1000000.0
  end

  value = value.round(5)
  new_value = new_value.round(5)
  #interaction_end(target, new_value, value, measurement)
end

def interaction_end(target, new_value, value, measurement)

  puts "#{value}#{measurement} \t entsprechen \t #{new_value}#{target}"

end
