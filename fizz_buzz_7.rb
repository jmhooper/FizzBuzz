module FizzBuzzExtension
  def to_s
    if (self % 3).zero? && (self % 5).zero?
      'fizzbuzz'
    elsif (self % 3).zero?
      'fizz'
    elsif (self % 5).zero?
      'buzz'
    else
      super
    end
  end
end

class Integer
  prepend FizzBuzzExtension
end

def fizz_buzz(limit)
  (1..limit).each do |num|
    puts num
  end
end

fizz_buzz(100)
