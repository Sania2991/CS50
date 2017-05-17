class Train
  attr_reader :number, :speed, :wagon

  def initialize(number)
    @number = number
    @speed = 0
    @wagon = 0
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

  # 1_4). Показывает кол-во вагонов.
  def count_wagon
    wagon
    puts "1_4). В поезде №#{number}: #{wagon} вагон(а/ов)"
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

  def speed_zero?
    @speed.zero?
  end

  protected

  attr_writer :number, :speed, :wagon

end