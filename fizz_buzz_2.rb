def fizz_buzz(limit, num = 1)
  return if num > limit

  if (num % 3).zero? && (num % 5).zero?
    puts 'fizzbuzz'
  elsif (num % 3).zero?
    puts 'fizz'
  elsif (num % 5).zero?
    puts 'buzz'
  else
    puts num
  end

  fizz_buzz(limit, num + 1)
end
fizz_buzz(100)
