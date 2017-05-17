class Wagon

  attr_reader :wagon

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


  protected

  attr_writer :wagon

end