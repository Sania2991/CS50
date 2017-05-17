class Truck < Car
  def load
    puts "Код для загрузки"
  end

  protected

  def initial_rpm
    500
  end
end