class RailwayStation
  include InstanceCounter
  include Validate

  attr_reader :name, :trains, :all_station
  @@all_station = []

  def self.all
    @@all_station
  end

  def self.all_list
    @@all_station
    #puts "Всего #{@@all_station.size} станций(я/ии):"
    #@@all_station.each_with_index do |name, index|
    #  puts " #{index+1}). \"#{name}\""
    #end
  end

  def initialize(name)
    if valid?("railwaystation", name)
      @name = name
      @trains = {}
      @@all_station << @name
      register_instance
    end
  end


  def add_train(train)
    number = train.number
    type = train.type
    self.trains[number] = type
    trains_on_station
  end

  def trains_on_station
    @trains
    #puts "На станции \"#{name}\" находятся след. поезда: #{@trains}"
  end

  def trains_on_station_by_type
    #print "На станции \"#{name}\": "
    #print "#{count_by_type(trains, :Passenger).size} пассаж. поездов и "
    #puts "#{count_by_type(trains, :Cargo).size} груз. поездов"
    count_by_type(trains, :Passenger)
    count_by_type(trains, :Cargo)
  end

  def send_train(train)
    if trains.include?(train.number)
      self.trains.delete(train.number)
      #puts "Поезд #{train.number} отошел от станции \"#{@name}\""
    else
      puts "Поезда № #{train.number} нет на станции \"#{@name}\""
    end
  end

  protected

  attr_writer :name, :trains

  private

  def count_by_type(hash = {}, type)
    count = []
    hash.each{|number, value| count << number if value == type}
    count
  end

end

# st1 = RailwayStation.new(123)