class PassangerTrain < Train
  attr_reader :type

  def initialize(number)
    super
    @type = "passanger"
    puts "Создан пассажирский поезд с номером: #{number}"
  end

end