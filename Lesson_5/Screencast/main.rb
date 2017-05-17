require_relative 'car.rb'
require_relative 'truck.rb'
require_relative 'sport_car.rb'

car1 = Car.new
car1.start_engine
puts "Car1 rpm = #{car1.current_rpm}"

truck1 = Truck.new
truck1.start_engine
puts "Truck1 rpm = #{truck1.current_rpm}"

sport_car1 = SportCar.new
sport_car1.start_engine
puts "sport_car1 rpm = #{sport_car1.current_rpm}"