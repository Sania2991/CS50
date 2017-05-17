puts "  Площадь треугольника.
Площадь треугольника можно вычилсить, зная его основание (a) и высоту (h) по формуле: 1/2*a*h.
Программа должна запрашивать основание и высоту треуголиника и возвращать его площадь."

puts "Enter the base (a) and height (h) of triangle"
data_input = gets.chomp.split
if data_input.count == 1
  puts "Enter the height (h) of triangle"
  h = gets.chomp.to_i
else
  h = data_input[1].to_i
end

a = data_input[0].to_i

area = 0.5*a*h
puts "The area of a triangle = #{area}"