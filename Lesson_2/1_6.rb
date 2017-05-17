=begin
Сумма покупок.
  Пользователь вводит поочередно название товара, цену за единицу и
кол-во купленного товара (может быть нецелым числом).
  Пользователь может ввести произвольное кол-во товаров до тех
пор, пока не введет "стоп" в качестве названия товара.
  На основе введенных данных требуетеся:
  Заполнить и вывести на экран хеш, ключами которого являются
названия товаров, а значением - вложенный хеш, содержащий цену за
единицу товара и кол-во купленного товара.
Также вывести итоговую сумму за каждый товар.
  Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end
pokupki = {}
total_price = 0

loop do
  puts "Enter the product name"
  name_product = gets.chomp.downcase
  break if name_product == "stop"
  puts "Enter the product price"
  price_product = gets.chomp
  puts "Enter the quantity of the product"
  kolich = gets.chomp
  pokupki[name_product.to_sym] = {price_product => kolich}
end

pokupki.each do |name, data_product|
  price_product = data_product.first[0].to_f
  kolich = data_product.first[1].to_f
  print "#{name}: price = #{price_product}, kolich = #{kolich}"
  puts "     = #{price_product*kolich} rub."
  total_price += price_product*kolich
end

puts
puts "Total price of the all product = #{total_price} rub."

# Нужное решение:
=begin

basket    = {}
sum       = 0
final_sum = 0

loop do
  puts 'Введите название товара или stop для выхода'
  name = gets.chomp
  break if name.downcase == 'stop'

  puts 'Введите цену товара'
  cost = gets.chomp.to_f

  puts 'Введите количество товара'
  count = gets.chomp.to_f

  sum           = cost * count
  basket[name]  = { cost => count }
  final_sum += sum

  puts "Сумма за текущий товар = #{sum}"
  puts "Хэш содержит #{basket}"
  puts "Сумма за все покупки в корзине = #{final_sum}"
end


=end