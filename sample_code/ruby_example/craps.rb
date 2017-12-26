# craps.rb

class Die

  POSSIBLE_VALUES = (1..6).to_a

  def roll
    POSSIBLE_VALUES.sample
  end
  
end

COME_OUT_LOSS = [2, 3, 12]
COME_OUT_WIN = [7, 11]

def won_come_out val
  COME_OUT_WIN.include?(val)
end

def lose_come_out
  COME_OUT_LOSE.include?(val)
end


def won_other_rounds val, orig
  val == orig
end


# EXECUTION STARTS HERE

puts "Enter your name > "
name = gets.chomp

d1 = Die::new
d2 = Die::new

game_over = false

until (game_over) do
  d1_val = d1.roll
  d2_val = d2.roll
  val = d1_val + d2_val
  puts "Die 1 roll: #{d1_val}"
  puts "Die 2 roll: #{d2_val}"
  puts "Total     : #{val}"
  game_over = true
end

