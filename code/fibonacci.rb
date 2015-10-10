include Math

class Fibonacci
  # Implement a method that will calculate the Nth number of the Fibonacci
  # sequence (http://en.wikipedia.org/wiki/Fibonacci_number)

  def self.calculate(n)
    raise ArgumentError, 'input must be numeric' unless n.is_a? Numeric
    raise ArgumentError, 'input must be positive' unless n > -1

    #Binet's Fibonacci Number Formula

    fibonacciNumber = (((((1 + sqrt(5)) ** n) - ((1 - sqrt(5)) ** n))/ ((2 ** n )*sqrt(5))))

    return fibonacciNumber.round(0)
  end


end