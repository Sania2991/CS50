class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    super
    @type = "cargo"
    puts "Создан грузовой поезд с номером: #{number}"
  end

end