require_relative './lib/game'

# record_hash = {
  #   :round1 => {
    #     "current guess" => 1233,
    #     "digits in correct position" => 3,
    #     "digits in secret code" => 0
    #   },
    
    #   :round2 => {
      #     "current guess" => 2211,
      #     "digits in correct position" => 2,
      #     "digits in secret code" => 1
      #   }
      # }
      
      # # record_hash.each do |key, round_hash|
      # #   round_hash.each do |key, value|
      # #     puts "#{key}: #{value}"
      # #   end
      # # end
      

# format_string = "| %-15s | %-27s | %-20s |"
      
# puts format_string % ['current guess', 'digits in correct position', 'digits in secret code']
# puts "|-" + "-"*15 + "-|-" + "-"*27 + "-|-" + "-"*20 + "-|"

# record_hash.each do |key, round_hash|
#   puts format_string % [round_hash['current guess'], round_hash['digits in correct position'], round_hash['digits in secret code']]
# end

game = Game.new(4, 4)
game.play