require_relative 'record'

class Game
  def initialize(game_mode_length, game_mode_max)
    @game_mode_length = game_mode_length
    @game_mode_max = game_mode_max
    @secret_code = nil
    @current_guess = nil
    @correct_digit_and_location = 0
    @correct_digit = 0
    @game_over_statement = ''
    @record = Record.new
  end

  def play
    puts 'welcome to mastermind!'

    get_secret_code

    @game_mode_length.times do
      @record.turn_count += 1 
      
      get_guess
      compare_with_secret_code
      
      @record.update_round(@current_guess, @correct_digit_and_location, @correct_digit)

      @record.print_record

      if @current_guess == @secret_code
        @game_over_statement = 'you win!'
        break
      # break before showing clues on final turn
      elsif @current_guess != @secret_code && @record.turn_count == @game_mode_length
        @game_over_statement = 'game over, better luck next time!'
        break
      end

    end
    puts @game_over_statement
  end

  def get_secret_code
    puts "please enter a secret code:"
    @secret_code = player_input
    puts 'great!'
  end

  def get_guess
    puts "guess the code:"
    @current_guess = player_input
  end

  def compare_with_secret_code
    # create hash of counts to decrement from
    digit_counts = @secret_code.tally

    compare_first_pass(digit_counts)
    compare_second_pass(digit_counts)
  end

  def compare_first_pass(count_hash)
    correct_digit_and_location_hint = 0

    # first pass: correct positions
    @current_guess.each_with_index do |digit, id|
      if digit == @secret_code[id]
        correct_digit_and_location_hint += 1
        # decrement from freq. count to avoid overtallying in second pass
        count_hash[digit] -= 1
      end
    end
    @correct_digit_and_location = correct_digit_and_location_hint
  end

  def compare_second_pass(count_hash)
    correct_digit_hint = 0

    # second pass: digit included
    @current_guess.each do |digit|

      # skip if number freq. is 0 (already been counted)
      if @secret_code.include?(digit) && count_hash[digit] > 0
        correct_digit_hint += 1
        # decrement from freq. count to avoid overtallying when checking previously evaluated positions
        count_hash[digit] -= 1
      end
    end
    @correct_digit = correct_digit_hint
  end

  def player_input
    # $stdout.flush
    loop do
      error_message = "Invalid input.\n\n"
      input = gets.chomp

      return input.split(%r{\s*}).map(&:to_i) if valid?(input, @game_mode_length, @game_mode_max)

      puts error_message
    end
  end

  def valid?(input, length, max)
    return false unless input.length == length
  
    input.each_char do |char|
      digit = char.to_i
      return false unless digit.between?(1, max)
    end
  
    return true
  end
end
