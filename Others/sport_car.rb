class SportCar < Car

  def initialize(number, type = :sport_car)
    super
  end

  def door_such_car?(door)
    raise "Wagon type not suitable Train type!" if door.class != SportCar
    true
    rescue => e
      puts e.inspect
  end

end