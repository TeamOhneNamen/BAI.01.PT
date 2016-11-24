# Author:: Ferdinand Trendelenburg
# Author:: Thorben Schomacker

class Numerik
  def initialize
    @solution_recursive = 0.0
    @counter = 0
  end
  def solve_iterative(x ,n, i = 1, t = 1)
      if (x.is_a?(Integer))
        x = x.to_f
      end
      if ((x < 0.0) || (x > 2.0))
          raise ArgumentError, "0 < x <= 2"
      else
        @solution_iterative = 0.0
        n.to_i.times { # sum of the term: (((-1)**(i+1)) * (((x - 1) ** i) / i))
          @solution_iterative = @solution_iterative + (((-1)**(i+1)) * (((x - 1) ** i) / i))
          i += 1
        }
        #puts "Solution: #{@solution_iterative} with n: #{n} \ntarget:   #{Math.log(x)}"
        @solution_iterative
      end
    end
    
  def solve_recursive(x, n, i = 1)
    if (x.is_a?(Integer))
      x = x.to_f
    end
    if ((x < 0.0) || (x > 2.0))
      raise ArgumentError, "0 < x <= 2"
    else
      @solution_recursive += (((-1)**(i+1)) * (((x - 1) ** i) / i))

      if @counter < n
        i += 1
        @counter += 1
        solve_recursive(x, n, i)
      else
        #puts "Solution: #{@solution_recursive} with n: #{n} \ntarget:   #{Math.log(x)}"
      end
      @solution_recursive
    end
  end

  def es_gilt(i = 0, n = 1000.0)
  sol = 0.0
  n.to_i.times{sol += (1.0/(2**i))
  i += 1
  }
  puts sol
  end
  
  def es_gilt_inject
    (0..100).inject(0){|summ , j|
      summ + (1.0/(2 ** j))
    }
  end   
  
  def es_gilt_reduce
    (0..100).reduce(0){|summ , j|
      summ + (1.0/(2 ** j))
    }
  end   
  
end

alg = Numerik.new()
#alg.solve(2, 1000) # way I calculated towards a relative precise
#-> from n = 10000 is the calculation precise on six positions after float point
