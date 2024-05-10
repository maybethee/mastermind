class Record
  FORMAT_STRING = "| %-11s | %-15s | %-27s | %-21s |"

  attr_accessor :turn_count, :current_guess, :hints

  def initialize
    @turn_count = 0
    @current_guess = nil
    @hints = [0, 0]
    @record_hash = {}
  end


  def update_current_guess(guess)
    @current_guess = guess
  end

  def update_hints(position_hint, digit_hint)
    @hints[0] = position_hint
    @hints[1] = digit_hint
  end

  def add_round_to_record
    @record_hash[@turn_count] = {
      "current guess" => @current_guess.join(''),
      "digits in correct position" => @hints[0],
      "digits in secret code" => @hints[1]
    }
  end

  def update_round(guess, position_hint, digit_hint)
    update_current_guess(guess)
    update_hints(position_hint, digit_hint)
    add_round_to_record
  end

  def print_record
    puts
    puts FORMAT_STRING % ['turn number', 'current guess', 'digits in correct position', 'digits in secret code']
    puts "|-" + "-"*11 + "-|-" + "-"*15 + "-|-" + "-"*27 + "-|-" + "-"*21 + "-|"
    
    @record_hash.each do |turn_number, round_hash|
      puts FORMAT_STRING % [turn_number, round_hash['current guess'], round_hash['digits in correct position'], round_hash['digits in secret code']]
    end
  end

end