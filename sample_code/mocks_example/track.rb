require_relative 'car'

class Track

  @car_locs = nil 

  RACE_LENGTH = 30
  
  def initialize *cars
    @car_locs = Hash::new
    cars.each do |car|
      @car_locs[car] = 0
    end
  end

  def check_for_winning_car
    return nil unless @car_locs.any? { |car, dist| dist >= RACE_LENGTH }
    @car_locs.sort_by { |k, v| v }.last
  end

  def print_locs
    20.times { print '*' }
    puts
    @car_locs.each do |car, dist|
      puts "#{car} : #{dist} laps"
    end
  end
  
  def race
    winning_car = nil
    until winning_car do
      # One round - call "move" on each car and update the location
      # in @car_locs by incrementing by the number of spots moved
      @car_locs.each do |k, v|
        @car_locs[k] += k.move
      end

      
      winning_car = check_for_winning_car

      print_locs unless winning_car
      
    end
 
    puts "#{winning_car[0]} wins the race!"
   
  end


end
