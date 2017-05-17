require_relative './validate.rb'
require_relative './instance_counter.rb'
require_relative './company.rb'
require_relative './train.rb'
require_relative './train_passenger.rb'
require_relative './train_cargo.rb'

require_relative './wagon.rb'
require_relative './wagon_passenger.rb'
require_relative './wagon_cargo.rb'

require_relative './railwaystation.rb'
require_relative './route.rb'

puts "\n\n\n\n********** СОЗДАНИЕ ВАГОНОВ **********\n"
wagon_1 = Wagon.new("111", :Passenger)
wagon_2 = WagonPassenger.new("qwere")
wagon_3 = WagonCargo.new("Q34")
wagon_4 = WagonCargo.new("Йqqqqw")
wagon_5 = WagonCargo.new("4q311")
puts (Wagon.instances + WagonCargo.instances + WagonPassenger.instances) == 5

puts "\n********** СОЗДАНИЕ ПОЕЗДОВ **********\n"
train_1 = Train.new("111-11",:Passenger)
#train_6 = Train.new("111-11",:Cargo)
train_2 = TrainPassenger.new("qwere")
train_3 = TrainCargo.new("Q1w-34")
train_4 = TrainCargo.new("qqq-qw")
train_5 = TrainCargo.new("1q311")
puts Train.count_trains == 5

puts "\n********** СОЗДАНИЕ СТАНЦИЙ **********\n"
station_1 = RailwayStation.new("Phili")
station_2 = RailwayStation.new("Kuntsevo")
station_3 = RailwayStation.new("Trehgorka")
station_4 = RailwayStation.new("Odintsovo")
puts RailwayStation.all.size == 4

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
station_1.trains_on_station_by_type
station_1.trains_on_station


puts "\n********** РАБОТА С КОМПАНИЯМИ **********\n"
wagon_1.name_company = "IT"
wagon_1.name_company
wagon_2.name_company = "IT"
wagon_2.name_company
wagon_3.name_company = "RGD"
wagon_3.name_company
wagon_4.name_company = "RGD"
wagon_4.name_company

train_1.name_company = "IT"
train_1.name_company

train_3.name_company

train_3.name_company = "RGD"
train_3.name_company


puts "\n********** РАБОТА методом RailwayStation::all **********\n"
RailwayStation::all

puts "Train::find(\"111-11\")  -  #{Train::find("111-11")}"
puts "Train::find(12) (nil)  -  #{Train::find("12")}"

RailwayStation.instances