class RailwayStation
  attr_reader :name, :trains

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

  private

  attr_writer :name, :trains

  def count_hash_dublicate(hash = {}, x)
    dublicate = []
    hash.each_pair {|key, value| dublicate << key if value == x}
    dublicate
  end

end