class Wagon
  include Validate
  include Company
  include InstanceCounter

  attr_reader :number, :type

  def initialize(number, type)
    if valid?("wagon", number, type)
      register_instance
      @number = number
      @type = type
    end
  end

end