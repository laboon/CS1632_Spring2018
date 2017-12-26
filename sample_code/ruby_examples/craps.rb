# craps.rb

# Create a class Die, with one method, roll, which will return a value
# from the range of 1..6

class Die

  # Turn the Range object (1..6) to an array with .to_a
  # This will allow us to use the Enumerable methods such as
  # .sample, which gives us a random element selected from
  # the POSSIBLE_VALUES array

  # Another way to do this would be rand(6) + 1
  
  POSSIBLE_VALUES = (1..6).to_a

  def roll
    POSSIBLE_VALUES.sample
  end
  
end

def print_line
  # Print the '*' character 20 times to make a line
  20.times { print '*' }
  # Now add a carriage return
  puts
end



def print_roll d1_val, d2_val
  val = d1_val + d2_val
  print_line
  puts "Die 1 roll: #{d1_val}"
  puts "Die 2 roll: #{d2_val}"
  puts "Total     : #{val}"
  print_line
  val
end

def roll
  d1 = Die::new
  d2 = Die::new
  d1_val = d1.roll
  d2_val = d2.roll
  # Note you need an explicit return to return multiple values
  return d1_val, d2_val
end

# EXECUTION STARTS HERE

puts "Enter your name > "
name = gets.chomp

game_status = :not_over
come_out = true
point = nil

until (game_status != :not_over) do
  
  d1_val, d2_val = roll
  val = print_roll d1_val, d2_val
  
  if come_out
    come_out = false
    case val
    when 2, 3, 12
      game_status = :lose
    when 7, 11
      game_status = :win
    else
      point = val
    end
  else
    if val == 7
      game_status = :lose
    elsif val == point
      game_status = :win
    else
      # Do nothing, game is still in play
    end
  end
    
end

if game_status == :win
  puts "You win, #{name}!"
else
  puts "You lose, #{name}!"
end
