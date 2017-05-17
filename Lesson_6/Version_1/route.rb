class Route
  attr_reader :stations_in_route, :e

  def initialize(*stations_for_route)   # принимается массив
    if stations_for_route.size >= 2
      @stations_in_route = []
      stations_for_route.each{|station| @stations_in_route << station.name}
      #puts "Создан новый маршрут со след. станциями: #{stations_in_route}"
    else
      puts "В маршруте должно быть не менее 2 станций!"
    end
  end

  def valid_type?(station)
    if station.class == RailwayStation
      true
    else
      @e = "Станция должна быть класса RailwayStation"
      false
    end
  end

  def add_station(station)
    if valid_type?(station)
      if stations_in_route.include?(station.name)
        puts "Эта станция уже есть в маршруте!"
      else
        self.stations_in_route.insert(-2, station.name)
        # puts "В маршрут добавлена новая станция: \"#{station.name}\""
      end
    else
      puts e
    end
  end

  def del_station(station)
    if valid_type?(station)
      stations_in_route.delete(station.name) if can_delete_station?(station)
    else
      puts e
    end
  end

  def list
    #puts "В маршруте следующие станции:"
    #stations_in_route.each_with_index do |station, index|
    #  puts "#{index+1}.".ljust(3) + "\"#{station}\""
    stations_in_route
    #end
  end


  private

  def can_delete_station?(station)
    if stations_in_route.include?(station.name) && (stations_in_route.size >= 3)
      # puts "Станция #{station.name} была удалена из маршрута"
      true
    elsif stations_in_route.size <= 2
      puts "В маршруте не может быть меньше 2 станций!"
      false
    else
      puts "Станции #{station.name} нет в маршруте!"
      false
    end
  end

  attr_writer :stations_in_route
end