module FuelTank

  def fill_tank(level)
    self. fuel_tank = level
  end

  def fuel_level
    self.fuel_tank
  end

  protected
  # private - не исп., т.к. не будет раотать self в классах
  attr_accessor :fuel_tank
end

module Debugger
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
    # send - запрос, позволяет обойти приватный метод
  end

  module ClassMethods   # методы класса
    def debug(log)
      puts "!!!DEBUG:  #{log} !!!"
    end
  end

  module InstanceMethods    # методы объекта
    def debug(log)
      self.class.debug(log)
    end

    def print_class
      puts self.class
      # self - указатель того класса, в который включен модуль
    end
  end
end


class MotoBike
  include FuelTank
  include Debugger

  def initialize
    debug("123")
  end
end


class Car
  include FuelTank
  attr_reader :current_rpm

  @@instances = 0

  def self.instances
    @@instances
  end

  debug "Start interface"

  def initialize
    @current_rpm = 0
    @@instances += 1
    self.class.debug 'initialize'
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    current_rpm.zero?
  end

  debug "End interface"

  protected

  attr_writer :current_rpm

  def initial_rpm
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm
  end
end