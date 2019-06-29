def puts(num)
  if (num % 3).zero? && (num % 5).zero?
    super 'fizzbuzz'
  elsif (num % 3).zero?
    super 'fizz'
  elsif (num % 5).zero?
    super 'buzz'
  else
    super
  end
end

def fizz_buzz(limit)
  (0..limit).map { |num| puts num }
end
fizz_buzz(100)
