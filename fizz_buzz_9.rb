class State
  def initialize
    @state_mapping = {}
  end

  def next_state(character)
    @state_mapping[character]
  end

  def add_state(state, character)
    @state_mapping[character] = state
  end
end

class ResultState < State
  attr_reader :result

  def initialize(result)
    @result = result
    super()
  end
end

class StateMachine
  def initialize(start_state, input)
    @start_state = start_state
    @input = input
  end

  def run
    current_state = @start_state
    @input.chars.each do |character|
      current_state = current_state.next_state(character)
    end
    current_state = current_state.next_state('EOL')

    if !current_state.kind_of?(ResultState)
      raise StandardError, "End state for #{@input} is not a valid end state"
    end
    current_state.result
  end
end

S = State.new; A = State.new; B = State.new; C = State.new; D = State.new
E = State.new; F = State.new; G = State.new; H = State.new; I = State.new
J = State.new; K = State.new; L = State.new; M = State.new; N = State.new
O = State.new;

NUMBER = ResultState.new(:number);
FIZZBUZZ = ResultState.new(:fizzbuzz)
FIZZ = ResultState.new(:fizz)
BUZZ = ResultState.new(:buzz)

S.add_state(A, 'x')
A.add_state(B, 'x'); A.add_state(NUMBER, 'EOL')
B.add_state(C, 'x'); B.add_state(NUMBER, 'EOL')
C.add_state(D, 'x'); C.add_state(FIZZ, 'EOL')
D.add_state(E, 'x'); D.add_state(NUMBER, 'EOL')
E.add_state(F, 'x'); E.add_state(BUZZ, 'EOL')
F.add_state(G, 'x'); F.add_state(FIZZ, 'EOL')
G.add_state(H, 'x'); G.add_state(NUMBER, 'EOL')
H.add_state(I, 'x'); H.add_state(NUMBER, 'EOL')
I.add_state(J, 'x'); I.add_state(FIZZ, 'EOL')
J.add_state(K, 'x'); J.add_state(BUZZ, 'EOL')
K.add_state(L, 'x'); K.add_state(NUMBER, 'EOL')
L.add_state(M, 'x'); L.add_state(FIZZ, 'EOL')
M.add_state(N, 'x'); M.add_state(NUMBER, 'EOL')
N.add_state(O, 'x'); N.add_state(NUMBER, 'EOL')
O.add_state(A, 'x'); O.add_state(FIZZBUZZ, 'EOL')

def fizz_buzz(limit)
  (1..limit).map { |num| 'x' * num }.each do |input|
    machine = StateMachine.new(S, input)
    result = machine.run
    if result == :number
      puts input.chars.count
    else
      puts result
    end
  end
end
fizz_buzz(100)
