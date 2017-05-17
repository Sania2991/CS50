module Company
  attr_accessor :name_company

  def name_company
    if @name_company.nil?
      puts "Производитель - неизвестен!"
    else
      puts "Производитель - #{@name_company}"
    end
  end
end