class Record
  attr_accessor :turn_count, :current_guess, :hints

  def initialize
    @turn_count = 0
    @current_guess = nil
    @hints = [0, 0]
  end

  def update_current_guess(guess)
    @current_guess = guess
  end

  def update_hints(position_hint, digit_hint)
    @hints[0] = position_hint
    @hints[1] = digit_hint
  end

  def print_record
    puts "| turn number | current guess | digits in correct position | digits in secret code |\n|      #{@turn_count}      |     #{@current_guess.join('')}      |              #{@hints.first}             |           #{@hints.last}           |"
  end

end