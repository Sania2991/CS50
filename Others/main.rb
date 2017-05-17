require _relative './car.rb'
require_relative './sport_car.rb'
require_relative './Door.rb'
require_relative './door_sport.rb'

car_1 = Car.new(1, :car)
car_2 = Car.new(2, :car)
car_3 = SportCar.new(3)
car_4 = SportCar.new(4)

door_1 = Door.new(1, :car)
door_2 = Door.new(2, :car)
door_3 = DoorSport.new(3)
door_4 = DoorSport.new(4)

#puts car_1.door_such_car?(door_1)
#puts car_2.door_such_car?(door_3)

puts car_3.door_such_car?(door_3)
