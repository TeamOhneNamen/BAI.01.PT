def transform_code

  for i in 0..3
    case(@code[i])
    when 1
      @code_farben.push("Blau")
    when 2
      @code_farben.push("Rot")
    when 3
      @code_farben.push("Grün")
    when 4
      @code_farben.push("Gelb")
    end
  end
end
