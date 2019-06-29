def divisible_by_three?(num)
  digit_sum = num.to_s.split('').map(&:to_i).sum.to_s
  return divisible_by_three?(digit_sum) unless digit_sum.length == 1
  %w[3 6 9].include?(digit_sum)
end

def divisible_by_five?(num)
  %w[0 5].include?(num.to_s.chars.last)
end

def divisible_by_fifteen?(num)
  divisible_by_five?(num) && divisible_by_three?(num)
end

def fizz_buzz(limit)
  (1..limit).each do |num|
    if divisible_by_fifteen?(num)
      puts 'fizzbuzz'
    elsif divisible_by_three?(num)
      puts 'fizz'
    elsif divisible_by_five?(num)
      puts 'buzz'
    else
      puts num
    end
  end
end
fizz_buzz(100)
