class RailwayStation
  include InstanceCounter
  attr_reader :name, :trains, :all_station
  @@all_station = []

  def self.all
    puts "Всего #{@@all_station.size} станций(я/ии):"
    @@all_station.each_with_index do |name, index|
      puts " #{index+1}). \"#{name}\""
    end
  end

  def initialize(name)
    @name = name
    @trains = {}
    @@all_station << @name
    register_instance
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