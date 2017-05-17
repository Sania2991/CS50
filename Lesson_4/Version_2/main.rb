require_relative './train.rb'
require_relative './train_passenger.rb'
require_relative './train_cargo.rb'

require_relative './wagon.rb'
require_relative './wagon_passenger.rb'
require_relative './wagon_cargo.rb'

require_relative './railwaystation.rb'

require_relative './route.rb'

puts "\n\n\n\n********** СОЗДАНИЕ ВАГОНОВ **********\n"
wagon_1 = WagonPassenger.new(1)
wagon_2 = WagonPassenger.new(2)
wagon_3 = WagonCargo.new(10)
wagon_4 = WagonCargo.new(11)
wagon_5 = WagonCargo.new(12)

puts "\n********** СОЗДАНИЕ ПОЕЗДОВ **********\n"
train_1 = TrainPassenger.new(1)
train_2 = TrainPassenger.new(2)
train_3 = TrainCargo.new(10)
train_4 = TrainCargo.new(11)
train_5 = TrainCargo.new(12)

puts "\n********** СОЗДАНИЕ СТАНЦИЙ **********\n"
station_1 = RailwayStation.new("Phili")
station_2 = RailwayStation.new("Kuntsevo")
station_3 = RailwayStation.new("Trehgorka")
station_4 = RailwayStation.new("Odintsovo")

puts "\n********** СОЗДАНИЕ МАРШРУТА **********\n"
route = Route.new(station_1)
route = Route.new(station_1, station_3, station_4)

puts "\n********** РАБОТА С МАРШРУТОМ **********\n"
route.add_station(station_1)
route.add_station(station_2)
route.list
route.del_station(station_2)
route.list

puts "\n********** РАБОТА С ПОЕЗДОМ **********\n"
train_1.take_route(route)
#train_1.station
train_1.next_station
train_1.next_station
train_1.next_station
train_1.list_route
#train_1.station
train_1.current_speed
train_1.speed_up(100)
train_1.speed_down(40)
train_1.speed_down(80)
train_1.stop

puts "\n********** РАБОТА С ВАГОНАМИ **********\n"
train_1.add_wagon(wagon_3)
train_1.add_wagon(wagon_1)
train_1.add_wagon(wagon_2)

train_3.add_wagon(wagon_1)
train_3.add_wagon(wagon_3)
train_3.add_wagon(wagon_4)
train_3.add_wagon(wagon_5)

train_3.count_wagon
train_3.list_wagon
train_1.count_wagon
train_1.list_wagon

train_1.del_wagon(wagon_1)
train_1.list_wagon

train_3.del_wagon(wagon_1)
train_3.list_wagon


puts "\n********** РАБОТА С ВАГОНАМИ **********\n"
station_1.trains_on_station
station_1.add_train(train_1)
station_1.send_train(train_2)
station_1.add_train(train_2)
station_1.add_train(train_3)
puts
station_1.trains_on_station_by_type
station_1.trains_on_station