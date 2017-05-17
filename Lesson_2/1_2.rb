# Заполнить массив числами от 10 до 100 с шагом 5
array_s_shagom = [10]
i = 10
loop do
  i += 5
  array_s_shagom << i
  break if i == 100
end
p array_s_shagom



# Нужное решение:
=begin

array = (10..100).to_a
array.delete_if { |x| x % 5 != 0 }
p array

=end