class Train
  include Validate
  include Company
  attr_reader :number, :type, :speed, :wagon, :route_of_train, :current_station,
              :list_train, :e
  @@list_train = {}

  def self.find(number)
    @@list_train.include?(number)? @@list_train[number] : nil
  end

  def self.count_trains
    @@list_train.size
  end

  def self.all_train_list
    @@list
    #index = 0
    #puts "Список всех поездов:"
    #@@list_train.each_key { |number| puts " #{index += 1}). #{number}" }
  end

  def initialize(number, type)
    valid_action!("identity", number)
    if valid?("train", number, type)
      @number = number
      @type = type
      @speed = 0
      @wagon = []
      @route_of_train = []
      @@list_train[number] = self
    end
  end

  def speed_up(x = 20)
    self.speed += x
    # puts "Скорость поезда № #{number} увеличена на #{x}. Тек. скор.: #{speed}"
  end

  def speed_down(x = 20)
    if x < speed
      self.speed -= x
      #puts "Скорость поезда № #{number} уменьшена на #{x}. Тек. скор.: #{speed}"
    elsif x == speed
      stop
    else
      puts "Скорость поезда меньше указанной величины!"
    end


  end

  def current_speed
    #puts "Текущая скорость поезда № #{number} равна #{speed}"
    speed
  end

  def stop(x = speed)
    self.speed -= x
    #puts "Поезд #{number} остановлен"
  end

  def count_wagon
    #puts "В поезде № #{number} - #{wagon.size} вагон(ов/а)"
    wagon.size
  end

  def list_wagon
    #puts "В поезде № #{number} находятся след. вагоны: #{wagon}"
    wagon
  end

  def valid_action?(case_by, wagon)
    valid_action!(case_by, wagon)
  rescue
    false
  end

  def add_wagon(wagon)
    if valid_action?("add", wagon)
      self.wagon << wagon.number
    else
      puts @e
    end
  end

  def del_wagon(wagon)
    if valid_action?("del", wagon)
      self.wagon.delete(wagon.number)
    else
      puts @e
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
      #puts "Поезду № #{number} назначили маршрут: #{stations}"
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
      #puts "Поезд прибыл на станцию \"#{current_station}\""
    end
  end

  def go_station(x)
      route_of_train[route_of_train.index(current_station) + x]
  end

  def list_route
    previous_station = go_station(-1)
    next_station = go_station(1)
    [go_station(-1), current_station, go_station(+1)]
    #puts "Предыдущая станция: \"#{go_station(-1)}\"" if !previous_station.nil?
    #puts "Текущая станция в маршруте: \"#{current_station}\""
    #puts "Следующая станция: \"#{go_station(+1)}\"" if !next_station.nil?
  end

  def speed_zero?
    speed.zero?
  end

  protected

  attr_writer :number, :type, :speed, :wagon, :route_of_train, :current_station

  def valid_action!(case_by, object)
    case case_by
      when "add"
        wagon = object
        if speed_zero? && type_of_wagon_correct?(wagon)
          true
        elsif !speed_zero?
          raise @e = "Сначала остановите поезд!"
          false
        else
          raise @e = "Нельзя присоединить этот вагон к поезду"
          false
        end
      when "del"
        wagon = wagon
        if speed_zero? && wagon.include?(wagon.number)
          true
        elsif !speed_zero?
          raise @e = "Сначала остановите поезд!"
          false
        else
          raise @e = "Такого вагона нет в поезеде!"
          false
        end
      when "identity"
        number = object
        if @@list_train.keys.include?(number)
          raise @e = "Такой номер поезда уже существует!"
          false
        else
          true
        end
      else
        raise @e = "!!! КРИТИЧЕСКАЯ ОШИБКА! Нет валидации для #{case_by} !!!"
        false
    end
  end
end