class NumerikRekussiv

  $solution = 0.0
  
  def solve(x ,n, i = 1, t = 1)
  
    $solution += (((-1)**(i+1)) * (((x - 1) ** i) / i))
    if n<t
      i += 1
      n += 1
      solve(x, n, i, t)
    else
      puts $solution
      puts n
      puts "---" #borderline between calculation and aim
      puts Math.log(x) # natural logarithm
    end

  end
end

alg = NumerikRekussiv.new()
alg.solve(2, 1.0, 1.0, 1000) # way I calculated towards a relative precise
#-> from n = 10000 is the calculation precise on six positions after float point
#alg.solve(2.0, 10000)
