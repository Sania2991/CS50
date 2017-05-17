class Train
  attr_accessor :type, :number, :speed, :wagon

  def initialize(type, number)
    @type = type
    @number = number
    @speed = 0
    @wagon = 0
    puts "Создан новый поезд. Тип: #{type}, номер: #{number}"
  end

  # 1_1). Набирает скорость.
  def go(x = 20)
    self.speed += x
    puts " 1_1). Скорость увеличена на #{x}. Текущая скорость равна #{speed}"
  end

  # 1_2). Показывает текущ. скорость
  def current_speed
    speed
    puts "1_2). Текущая скорость равна #{speed}"
  end

  # 1_3). Тормозит
  def stop
    if speed_zero?
      puts "1_3). Поезд уже стоит!"
    else
      self.speed = 0
      puts "1_3). Поезд остановлен."
    end
  end

  # 1_4). Показывает кол-во вагонов.
  def count_wagon
    wagon
    puts "1_4). В поезде №#{number}: #{wagon} вагон(а/ов)"
  end

  # 1_5_1). Добавляем вагон(ы).
  def add_wagon(x = 1)
    if speed_zero?
      self.wagon += x
      puts "1_5_1). Добавили вагон(ы): #{x} шт. Тек. кол-во вагонов: #{wagon}"
    else
      puts "1_5_1). Сначала необходимо остановить поезд!"
    end
  end

  # 1_5_2). Удаляем выгон(ы).
  def del_wagon(x = 1)
    if !speed_zero?
      puts "1_5_2). Сначала необходимо остановить поезд!"
    elsif wagon == 0
      puts "1_5_2). В поезде нет вагонов"
    elsif (wagon - x) < 0
      puts "1_5_2). В поезде меньше вагонов, чем вы хотите отнять!"
    else
      self.wagon -= x
      puts "1_5_2). Отняли #{x} вагон(а/ов). Тек. кол-во вагонов: #{wagon}"
    end
  end

  def take_route(station)
    @station = station
    puts "Поезд №#{@number} готов ехать с станции #{@station.first} на станцию #{@station.last}"
  end

  def move(station)
    if @route.include?(station)
      @station = station
      puts "Поезд №#{@number} приехал на с станцию #{@station}"
    else
      puts "Такой станции нет в маршруте"
    end
  end

end

class RailwayStation
  attr_accessor :name, :trains

  def initialize(name)
    @name = name
    @trains = {}
    puts "2_1). Создана новая станция: #{name}"
  end

  def take_train(train = {})
    @number = train.number
    @type = train.type
    if @number.nil? || @type.nil?
      puts "Невозможно принять такой поезд"
    else
      puts "2_2). Станция #{name} приняла поезд №:#{@number} типа #{@type}"
      @trains[@number] = @type
    end
  end

  def send_train(train = {})
    @number = train.number
    @type = train.type
    if @trains.include?(@number)
      @trains.delete(@number)
      puts "2_3). Поезд № #{@number} был отправлен со станции #{@name}"
    else
      puts "2_3). Поезда № #{@number} нет на станции #{@name}"
    end
  end

  def list
    puts "2_4). На станции сейчас следующие поезда: #{@trains.keys}"
  end

  def list_type
    puts "2_5). На станции #{name} следующие номера поездов типа 1:
          #{count_hash_dublicate(@trains, 1)}"
    puts "2_5). На станции #{name} следующие номера поездов типа 2:
          #{count_hash_dublicate(@trains, 2)}"
  end
end

class Route
  attr_accessor :stations

  def initialize(stations = [])
    if stations.size >= 2
      @stations = stations
      puts "3_1). Создан маршрут от #{@stations.first} до #{@stations.last}"
    else
      puts "Указано мало станций для маршрута"
    end
  end

  def first_station
    puts "3_1_2). Первая станция: #{@station.first}"
  end

  def last_station
    puts "3_1_3). Конечная станция: #{@station.last}"
  end

  def add_station(station)
    @stations.insert(-2, station)
    puts "3_2). В маршрут добавлена станция(и) #{station}"
  end

  def del_station(station)
    if @stations.include?(station)
      @stations.delete(station)
      puts "3_3). Станция #{station} была удалена из маршрута."
    else
      puts "3_3). Невозможно удалить. Маршрут не содержит станцию #{station}"
    end
  end

  def list
    puts "Маршрут от #{@stations.first} до #{@stations.last}"
    @stations.each_with_index{ |station, index| puts "#{index + 1}. #{station}"}
  end

end

module Train_test
  puts "\n\n\n1. train1 = Train.new(1, 10)"
  $train1 = Train.new(1, 10)
  puts "\n2. train1.current_speed"
  $train1.current_speed
  puts "\n3. train1.go"
  $train1.go
  puts "\n4. train1.add_wagon"
  $train1.add_wagon

  puts "\n5. train1.del_wagon"
  $train1.del_wagon
  puts "\n6. train1.go(100)"
  $train1.go(100)
  puts "\n7. train1.stop"
  $train1.stop
  puts "\n8. train1.add_wagon"
  $train1.add_wagon
  puts "\n9. train1.add_wagon(5)"
  $train1.add_wagon(5)

  puts "\n\n10. train1.del_wagon(2)"
  $train1.del_wagon(2)
  puts "\n11. train1.del_wagon(5)"
  $train1.del_wagon(5)
  puts "\n12. train1.current_speed"
  $train1.current_speed
  puts "\n13. train1.count_wagon"
  $train1.count_wagon

  $train2 = Train.new(2, 30)
end

module Station_test
  puts "\n\n14. station1 = RailwayStation.new(Phili)"
  $station1 = RailwayStation.new("Phili")
  $station2 = RailwayStation.new("Kuntsevo")
  $station3 = RailwayStation.new("Trechgorka")
  $station4 = RailwayStation.new("Odintsovo")

  puts "\n15. $station1.take_train($train1)"
  $station1.take_train($train1)

  puts "\n16. $station1.take_train($train2)"
  $station1.take_train($train2)

  puts "\n17. $station1.list"
  $station1.list

  puts "\n18. $station1.send_train($train1)"
  $station1.send_train($train1)

  puts "\n18_2. $station1.take_train($train1)"
  $station1.take_train($train1)

  puts "\n19. $station1.list_type"
  $station1.list_type
end

module Route_test
  puts "\n20. route1 = Route.new($station1)"
  route1 = Route.new([$station1.name])

  puts "\n20_2. route1 = Route.new($station1, $station4)"
  route1 = Route.new([$station1.name, $station4.name])

  puts "\n21. route1.list"
  route1.list

  puts "\n22. route1.add_station($station2)"
  route1.add_station($station3.name)

  puts "\n23. route1.list"
  route1.list

  puts "\n24. route1.del_station($station2)"
  route1.del_station($station3.name)

  puts "\n25. route1.list"
  route1.list
end

private

def speed_zero?
  @speed.zero?
end

def count_hash_dublicate(hash = {}, x)
  dublicate = []
  hash.each_pair {|key, value| dublicate << key if value == x}
  dublicate
end


