class Train
  attr_reader :number, :type, :speed, :wagon, :route_of_train, :current_station

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagon = []
    @route_of_train = []
    puts "Собрали новый поезд № " + @number.to_s.ljust(3) + " типа: #{@type}"
  end

  def speed_up(x = 20)
    self.speed += x
    puts "Скорость поезда № #{number} увеличена на #{x}. Тек. скор.: #{speed}"
  end

  def speed_down(x = 20)
    if x < speed
      self.speed -= x
      puts "Скорость поезда № #{number} уменьшена на #{x}. Тек. скор.: #{speed}"
    elsif x == speed
      stop
    else
      puts "Скорость поезда меньше указанной величины!"
    end


  end

  def current_speed
    puts "Текущая скорость поезда № #{number} равна #{speed}"
  end

  def stop(x = speed)
    self.speed -= x
    puts "Поезд #{number} остановлен"
  end

  def count_wagon
    puts "В поезде № #{number} - #{wagon.size} вагон(ов/а)"
  end

  def list_wagon
    puts "В поезде № #{number} находятся след. вагоны: #{wagon}"
  end

  def add_wagon(wagon)
    if speed_zero? && type_of_wagon_correct?(wagon)
      self.wagon << wagon.number
      puts "В поезд № #{number} добавлен вагон № #{wagon.number}."
    elsif !speed_zero?
      puts "Сначала остановите поезд!"
    else
      puts "Нельзя присоединить этот вагон к поезду"
    end
  end

  def del_wagon(wagon_del)
    if speed_zero? && wagon.include?(wagon_del.number)
      self.wagon.delete(wagon_del.number)
      puts "От поезда № #{number} отцепили вагон № #{wagon_del.number}."
    elsif !speed_zero?
      puts "Сначала остановите поезд!"
    else
      puts "Такого вагона нет в поезеде!"
    end
  end

  def type_of_wagon_correct?(wagon)
    type == wagon.type
  end

  def take_route(route = [])
    stations = route.stations_in_route
    if stations.size >=2
      self.route_of_train = stations
      self.current_station = stations.first
      puts "Поезду № #{number} назначили маршрут: #{stations}"
    else
      puts "В маршруте должно быть минимум 2 станции!"
    end
  end

  def next_station
    if route_of_train.nil?
      puts "Поезду ещё не присвоин маршрут!"
    elsif current_station == route_of_train.last
      puts "Поезд находится на конечной станции - #{current_station}!"
    else
      self.current_station = go_station(+1)
      puts "Поезд прибыл на станцию \"#{current_station}\""
    end
  end

  def go_station(x)
      route_of_train[route_of_train.index(current_station) + x]
  end

  def list_route
    previous_station = go_station(-1)
    next_station = go_station(1)
    puts "Предыдущая станция: \"#{go_station(-1)}\"" if !previous_station.nil?
    puts "Текущая станция в маршруте: \"#{current_station}\""
    puts "Следующая станция: \"#{go_station(+1)}\"" if !next_station.nil?
  end

  def speed_zero?
    speed.zero?
  end

  private

  attr_writer :number, :type, :speed, :wagon, :route_of_train, :current_station

end
