def fizz_buzz(limit)
  (0..limit).each do |num|
    if (num % 3).zero? && (num % 5).zero?
      puts 'fizzbuzz'
    elsif (num % 3).zero?
      puts 'fizz'
    elsif (num % 5).zero?
      puts 'buzz'
    else
      puts num
    end
  end
end
fizz_buzz(100)
