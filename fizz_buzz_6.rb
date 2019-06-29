require 'thwait'

def fizz_buzz(limit)
  ThreadsWait.all_waits((1..limit).map do |num|
    Thread.new do
      sleep num / 10.0
      break puts 'fizzbuzz' if num % 3 == 0 && num % 5 == 0
      break puts 'fizz' if num % 3 == 0
      break puts 'buzz' if num % 5 == 0
      puts num
    end
  end)
end
fizz_buzz(100)
