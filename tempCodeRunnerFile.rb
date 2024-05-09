format_string = "| %-15s | %-27s | %-20s |"
      
puts format_string % ['current guess', 'digits in correct position', 'digits in secret code']
puts "|-" + "-"*15 + "-|-" + "-"*27 + "-|-" + "-"*20 + "-|"

record_hash.each do |key, round_hash|
  puts format_string % [round_hash['current guess'], round_hash['digits in correct position'], round_hash['digits in secret code']]
end