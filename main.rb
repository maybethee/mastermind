require_relative './lib/game'

difficulty_levels = {
  'easy' => 4,
  'medium' => 6,
  'hard' => 8
}

def choose_difficulty
  puts "\nChoose desired difficulty (length of code):\n\neasy   ★ (4 digits)\nmedium ★★ (6 digits)\nhard   ★★★ (8 digits)\n\n"
end

def get_desired_difficulty
  loop do
    error_message = "Please enter a valid difficulty level\n\n"
    input = gets.chomp

    return input if %w[easy medium hard].include?(input.downcase)

    puts error_message
  end
end

def play_again_choice
  loop do
    error_message = "Please enter either y or n\n\n"
    input = gets.chomp

    return input if %w[y n].include?(input.downcase)

    puts error_message
  end
end

puts "\nWelcome to Code Breaker!"
loop do
  choose_difficulty
  game = Game.new(difficulty_levels[get_desired_difficulty])
  game.play
  puts "\nPlay again? (y/n)"

  case play_again_choice
  when 'n' then break
  when 'y' then redo
  end
end
puts "\nThanks for playing! Goodbye~"
