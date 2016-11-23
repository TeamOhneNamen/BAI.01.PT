class NumerikRekussiv
  $zaehler = 0
  $solution = 0.0
  def solve(x, n, i = 1)
    if (x.is_a?(Integer))
      x = x.to_f
    end
    if ((x < 0.0) || (x > 2.0))
      raise ArgumentError, "Der Wert muss zwischen 0 und 2 liegen"
    else
      $solution += (((-1)**(i+1)) * (((x - 1) ** i) / i))

      if $zaehler < n
        i += 1
        $zaehler += 1
        solve(x, n, i)
      else
        puts $solution
        puts n
        puts "---" #borderline between calculation and aim
        puts Math.log(x) # natural logarithm
      end
    end
  end

  def es_gilt(i = 0, n = 1000.0)
  sol = 0.0
  n.to_i.times{sol += (1.0/(2**i))
  i += 1
  }
  puts sol
  end
  
  def reduce
    (0..100).reduce{|summ , j|
      j = j.to_f
      summ + (1.0/(2**j))
    }
  end   
  
end

alg = NumerikRekussiv.new()
#alg.solve(2, 1000) # way I calculated towards a relative precise
#-> from n = 10000 is the calculation precise on six positions after float point
alg.solve(2.0, 1000)
alg.es_gilt
puts alg.reduce
