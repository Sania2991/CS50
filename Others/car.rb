class Car

  attr_accessor :type, :number

  def initialize(number, type)
    @number = number
    @type = type
  end

  def door_such_car?(door)
    raise "Wagon type not suitable Train type: #{door.type == self.type}" if door.type != self.type
    true
    rescue
      puts "**** Этот вагон не подходит к этому поезду"
  end

end