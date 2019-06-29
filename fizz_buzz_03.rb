##
# Iterates over numbers from 1 up to a specified limit and prints something
# according to these rules rules:
#
# - If a number is divisible by 3, print 'fizz'
# - If a number is divisible by 5, print 'buzz'
# - If a number is divisible by neither 3 or 5, print the number
#
class FizzBuzzer
  INITIAL_NUM = 1
  THREE = 3
  FIVE = 5
  FIZZ = 'fizz'.freeze
  BUZZ = 'buzz'.freeze

  attr_reader :limit
  attr_accessor :num

  def initialize(limit)
    @limit = limit
    self.num = INITIAL_NUM
  end

  # rubocop:disable Metrics/MethodLength
  def call
    while should_continue?
      if num_divisible_by_three? && num_divisible_by_five?
        print_fizz_buzz
      elsif num_divisible_by_three?
        print_fizz
      elsif num_divisible_by_five?
        print_buzz
      else
        print_num
      end
      increment_num
    end
  end
  # rubocop:enable Metrics/MethodLength

  private

  def increment_num
    self.num += INITIAL_NUM
  end

  def num_divisible_by_three?
    (num % THREE).zero?
  end

  def num_divisible_by_five?
    (num % FIVE).zero?
  end

  def print_buzz
    puts BUZZ
  end

  def print_fizz
    puts FIZZ
  end

  def print_fizz_buzz
    puts [FIZZ, BUZZ].join
  end

  def print_num
    puts num
  end

  def should_continue?
    num <= limit
  end
end

FizzBuzzer.new(100).call
