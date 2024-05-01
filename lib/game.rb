class Game
  def initialize(game_mode_length, game_mode_max)
    @game_mode_length = game_mode_length
    @game_mode_max = game_mode_max
  end

  def play
    puts 'welcome to mastermind!'

    player_input

    puts 'thank you!'
  end

  def player_input
    puts "please enter a secret code:"
    $stdout.flush
    loop do
      error_message = "Invalid input.\n\n"
      secret_code = gets.chomp

      return secret_code if valid?(secret_code, @game_mode_length, @game_mode_max)

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