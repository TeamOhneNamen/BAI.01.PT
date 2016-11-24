require_relative "./convert_to_int_and_string.rb"
def table(value_measurement, target, jn, schrittweite, endwert, target2, target3)
  @schrittweite = 0
  @schrittweite = schrittweite
  @endwert = endwert
  @schritt = 0

  while @schritt < @endwert
    @schritt += @schrittweite
    table_array = []
    table_array [@schritt[0]] = convert_in_therms(value_measurement, target, @schritt, jn)
    table_array [@schritt[1]] = convert_in_therms(value_measurement, target2, @schritt, jn)
    table_array [@schritt[2]] = convert_in_therms(value_measurement, target3, @schritt, jn)

    value_table = convert_float(value_measurement, target, 1, jn) * @schritt
    measurement_table = convert_string(value_measurement, target, 1, jn)

    puts "#{value_table}#{measurement_table} = #{table_array [@schritt[0]]}#{target}"
    puts "     = #{table_array[@schritt[1]]}#{target2}"
    puts "     = #{table_array[@schritt[2]]}#{target3}"
    puts "--------------"
  end
end

