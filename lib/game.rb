class Game
  def initialize(game_mode_length, game_mode_max)
    @game_mode_length = game_mode_length
    @game_mode_max = game_mode_max
    @secret_code = nil
    @current_guess = nil
    @correct_digit_and_location = 0
    @correct_digit = 0
  end

  def play
    puts 'welcome to mastermind!'

    get_secret_code

    # @game_mode_length.times do 
    get_guess
    compare_with_secret_code
    # end

  end

  def get_secret_code
    puts "please enter a secret code:"
    @secret_code = player_input
    puts 'thank you!'
  end

  def get_guess
    puts "guess the code:"
    @current_guess = player_input
  end

  def compare_with_secret_code
    # create hash of counts to decrement from
    digit_counts = @secret_code.tally

    puts "performing first pass"
    # first pass: correct positions
    @current_guess.each_with_index do |digit, id|
      if digit == @secret_code[id]
        @correct_digit_and_location += 1
        # decrement from freq. count to avoid overtallying in second pass
        digit_counts[digit] -= 1
      end
    end

    # second pass: digit included 
    puts "performing second pass"
    @current_guess.each do |digit|

      # skip if number freq. is 0 (already been counted)
      if @secret_code.include?(digit) && digit_counts[digit] > 0
        @correct_digit += 1
        # decrement from freq. count to avoid overtallying when checking previously evaluated positions
        digit_counts[digit] -= 1
      end
    end

    puts "correct digit and location: #{@correct_digit_and_location}"
    puts "digit in code: #{@correct_digit}"
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