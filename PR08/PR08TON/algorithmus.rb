class Algorithm
  def solve(x ,n, i = 1, t = 1)
    if (x.is_a?(Integer))
      x = x.to_f
    end
    if ((x < 0.0) || (x > 2.0))
        raise ArgumentError
    else
      @solution = 0.0
      n.to_i.times { # sum of the term: (((-1)**(i+1)) * (((x - 1) ** i) / i))
        @solution = @solution + (((-1)**(i+1)) * (((x - 1) ** i) / i))
        i += 1
      }
      n -= 1
      puts @solution
      puts n
      puts "---" #borderline between calculation and aim
      puts Math.log(x) # natural logarithm

    end
  end

end

alg = Algorithm.new()
#alg.solve(2, 1.0, 1.0, 10000) # way I calculated towards a relative precise
#-> from n = 10000 is the calculation precise on six positions after float point
alg.solve(2.0, 10000)