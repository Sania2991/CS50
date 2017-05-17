module Company
  include Validate
  attr_accessor :name_company

  def name_company= (name)
    if valid?("name_company", name)
      @name_company = name
    end
  end

  def name_company
    if @name_company.nil?
      puts "Производитель - неизвестен!"
    else
      @name_company
      #puts "Производитель - #{@name_company}"
    end
  end
end