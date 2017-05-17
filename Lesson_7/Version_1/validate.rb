module Validate
  attr_reader :e
  NUMBER_OF_TRAIN_FORMAT = /^([a-zа-я\d]{3})(-?)([a-zа-я\d]{2})$/i
  NAME_OF_STATION_FORMAT = /^[A-ZА-Я\d]{1}\w*[^ ]$/
  NUMBER_OF_WAGON_FORMAT = /^[а-яa-z\d][а-яa-z\d_-]{,5}$/i

  def valid?(*var)
    validate!(*var)
  rescue
    puts e
    false
  end

  protected

  def validate!(case_by, *var)
    case case_by
      when "railwaystation"
        name = var[0]
        raise @e = "Name should be type of String" if name.class != String
        raise @e = "Name should be at least 2 symbol" if name.length < 2
        raise @e = "Invalid format" if name !~ NAME_OF_STATION_FORMAT
      when "train"
        number = var[0]
        type = var[1]
        raise @e = "Invalid format!" if number !~ NUMBER_OF_TRAIN_FORMAT
        raise @e = 'Type should be "Cargo" or "Passenger"' if \
          type != :Cargo && type != :Passenger
      when "wagon"
        number = var[0]
        type = var[1]
        raise @e = "Invalid format!" if number !~ NUMBER_OF_WAGON_FORMAT
        raise @e = 'Type should be "Cargo" or "Passenger"' if \
          type != :Cargo && type != :Passenger
      when "name_company"
        name = var[0]
        raise @e = "Name should be type of String" if name.class != String
      else
        raise @e = "!!! КРИТИЧЕСКАЯ ОШИБКА! Нет валидации для #{case_by} !!!"
        return false
    end
    true
  end
end