class Train
  attr_accessor :number, :type, :list, :wagon, :speed

  def initialize(number, type)
    @number = number
    @type   = type
    @list[number] = type
    @speed = 0
    @wagon = 0
    puts "Добавлен новый поезд: номер - #{number}, тип - #{type}"
  end

  # Набирает скорость
  def go(x = 20)
    puts "Скорость увеличина на #{x}"
    self.speed += x
  end

  def current_speed
    puts "Текущая скорость равна #{speed}"
    speed
  end

  def stop
    puts speed == 0 ? "Поезд уже стоит!" : "Поезд остановлен!"
    self.speed = 0
  end

  def count_wagon
    puts "В поезде № #{number} - #{wagon} вагонов"
    wagon
  end

  def add_wagon(x = 1)
    puts "Добавили #{x} вагон(ов)"
    self.wagon += x
  end

  def del_wagon(x = 1)
    if wagon == 0
      puts "В поезде нет вагонов"
    elsif (wagon - x) < 0
      puts "В поезде меньше вагонов, чем вы хотите убрать!"
    else
      puts "Убрали #{x} вагон(ов)"
      self.wagon -= x
    end
  end
end


class RailswayStation
  attr_accessor :name

  def initialize(name)
    @name = name
    @hash = {123 => 1, 124 => 2}
  end

  def add_train(number)
    puts @list.class
    puts @list.has_key?(number)
    #puts @list.include?(number) ?  "DAA!!!" : "NOOO!((("
  end
end


@train1 = Train.new(123, 1)

@station1 = RailswayStation.new("Phili")
@station1.add_train(123)
#@station1.add_train(124)