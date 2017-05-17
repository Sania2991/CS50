class Train

  attr_accessor :speed, :count_box, :route, :train_name, :type
  attr_accessor :route, :current_station

  def initialize(number, count, type)
    @train_name = number
    @count_box = count
    @type = type
    @speed = 0
    @route = []
    puts "Добавлен новый поезд: #{number}"
  end

  module TrainProcess
    # набирать скорость
    def go(speed_up)
      self.speed += speed_up
      puts "Скорость увеличина на #{speed_up}, текущая скорость: #{speed}"
    end

    def current_speed
      puts "Текущая скорость поезда: #{speed}"
    end

    def stop
      self.speed = 0
      puts "Поезд остановлен!"
    end
  end

  module TrainBox
    def count
      puts "Количество вагонов: #{count_box} "
    end

    def box_up
      if speed == 0
        self.count_box +=1
        puts "Увеличено число вагонов. Текущее число вагонов: #{count_box}"
      else
        puts "Сначала нужно остановить поезд!"
      end
    end

    def box_down
      if speed == 0
        self.count_box -= 1
        puts "Уменьшили число вагонов. Текущее число вагонов: #{count_box}"
      else
        puts "Сначала нужно остановить поезд!"
      end
    end
  end

  module TrainTravel
    def receive_route(route)
      self.route = route
      puts "Поезд #{train_name} принял новый маршрут: #{route.list_stations}"
    end

    def current_station
      self.current_station = route.list_stations.first if current_station.nil?
      puts "123123123123"
      puts route.list_stations.first
    end

    def next_station
      #current_station =
    end
  end

end

class RailswayStation

  attr_accessor :station_name, :train_names

  def initialize(station_name)
    @station_name = station_name
    @train_names = []
    puts "Создали новую станцию: #{station_name}"
  end

  def receive(train)
    self.train_names << train
    puts "На станцию #{station_name} прибыл поезд: #{train.train_name}"
  end

  def current_trains
    puts "\nНа станции #{station_name}  находятся след. поезда: "
    train_names.each {|train| print "#{train.train_name}, "}
    puts
  end

  def current_trains_type
    light_train = train_names.select {|train| train.type == 1}.size
    hard_train = train_names.size - light_train
    puts "\nКоличество поездов на станции #{station_name}:
              пассажирских: #{light_train} шт.
                  грузовых: #{hard_train} шт."
  end

  def send(train)
    self.train_names.delete(train)
    puts "Поезд #{train.train_name} отбыл со станции: #{station}"
  end
end

class Route
  attr_accessor :list

  def initialize(first, second)
    @list = []
    @list << first << second
  end

  def list_stations
    list1 = []
    list.each {|elem| list1 << elem.station_name }
    list1
  end

  def add(station)
    self.list << station
    puts "\nВ маршрут добавили новую станцию: #{station.station_name}"
  end

  def delete(station)
    @list.delete(station)
    puts "\nИз маршрута удалили станцию #{station.station_name}"
  end
end

@train1 = Train.new("train1",12,1)
@train2 = Train.new("train2",24,2)
@train3 = Train.new("train3",10,1)
@train4 = Train.new("train4",5,1)
@train5 = Train.new("train5",20,2)
puts

@station1 = RailswayStation.new("Ointsovo")
@station2 = RailswayStation.new("Trechgorka")
@station3 = RailswayStation.new("Phili")
@station4 = RailswayStation.new("Begovaya")
puts

@station1.receive(@train1)
@station2.receive(@train2)
@station1.receive(@train3)
@station1.receive(@train5)

@station1.current_trains

@station1.current_trains_type

@route1 = Route.new(@station1, @station2)
@route1.add(@station3)
@route1.list_stations

@route1.delete(@station1)
@route1.list_stations

@train1.receive_route(@route1)


@route1.add(@station4)
puts "123 #{@train1.route.list_stations}"
p @route1.list_stations


puts "333"
p @train1.current_station
puts "Текущая станция:  #{@train1.current_station}"



