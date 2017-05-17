class Wagon

  attr_reader :number, :type

  def initialize(number, type)
    @number = number
    @type = type
    puts "Создали новый вагон №: " + @number.to_s.ljust(4) + "типа: #{@type}"
  end

end