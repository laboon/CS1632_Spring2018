require_relative 'car'
require_relative 'track'

c1 = Car::new "Red"
c2 = Car::new "Blue"
c3 = Car::new "Yellow"
t = Track::new c1, c2, c3
t.race 
