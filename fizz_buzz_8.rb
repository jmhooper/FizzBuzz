class FizzBuzz
  include Enumerable

  def initialize(limit)
    @limit = limit
  end

  def each
    num = 1
    while num <= @limit
      if num % 3 == 0 && num % 5 == 0
        yield 'fizzbuzz'
      elsif num % 3 == 0
        yield 'fizz'
      elsif num % 5 == 0
        yield 'buzz'
      else
        yield num
      end
      num += 1
    end
  end
end

def fizz_buzz(limit)
  FizzBuzz.new(limit).each { |output| puts output }
end
fizz_buzz(100)
