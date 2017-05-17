module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :count_instances_of_class

    def instances
      #!puts "Количество объектов = #{count_instances_of_class} шт."
      count_instances_of_class
    end
  end

  module InstanceMethods

    protected
    def register_instance
      self.class.count_instances_of_class ||= 0
      self.class.count_instances_of_class += 1
    end
  end
end