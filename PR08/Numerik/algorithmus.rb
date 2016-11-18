class Algorithm
  
  def solve(x,n, i = 1)
    if ((x < 0) || !x.is_a?(Integer) || (x > 2))
      raise ArgumentError, "should be Int 0 < x <= 2"
    end
    #sum
    sum = 0
    puts 0.upto(n) {|i| sum = sum + Float((-1)**i)*(x**i)}
    #sum
    puts (-1)**(i+1) * (x - 1) ** i / i
    puts Math.log10(x)
  end
  
end
alg = Algorithm.new()
alg.solve(2,1)