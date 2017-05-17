class RailwayStation
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = {}
    puts "Создана станция: \"#{@name}\""
  end

  def add_train(train)
    number = train.number
    type = train.type
    self.trains[number] = type
    trains_on_station
  end

  def trains_on_station
    puts "На станции \"#{name}\" находятся след. поезда: #{@trains}"
  end

  def trains_on_station_by_type
    print "На станции \"#{name}\": "
    print "#{count_by_type(trains, :Passenger).size} пассаж. поездов и "
    puts "#{count_by_type(trains, :Cargo).size} груз. поездов"
  end

  def send_train(train)
    if trains.include?(train.number)
      self.trains.delete(train.number)
      puts "Поезд #{train.number} отошел от станции \"#{@name}\""
    else
      puts "Поезда № #{train.number} нет на станции \"#{@name}\""
    end
  end

  private

  def count_by_type(hash = {}, type)
    count = []
    hash.each{|number, value| count << number if value == type}
    count
  end

  attr_writer :name, :trains
end
#Станция:
#Имеет название, которое указывается при ее создании
#Может принимать поезда
#Может показывать список всех поездов на станции, находящиеся в текущий момент
#Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
#Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).
