require_relative './lib/game'

difficulty_levels = {
  'easy' => 4,
  'medium' => 6,
  'hard' => 8
}

def welcome_message
  puts "\nWelcome to Code Breaker! Choose desired difficulty (length of code):\n\neasy   ★ (4 digits)\nmedium ★★ (6 digits)\nhard   ★★★ (8 digits)"
end

def player_input
  loop do
    error_message = "Please enter a valid difficulty level\n\n"
    input = gets.chomp

    return input if valid?(input)

    puts error_message
  end
end

def valid?(input)
  %w[easy medium hard].include?(input)
end

welcome_message
game = Game.new(difficulty_levels[player_input])
game.play