class Route
  attr_reader :stations

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

  private

  attr_writer :stations

end