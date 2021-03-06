puts "Квадратное уравнение (усложненное задание).
Пользователь вводит 3 коэффициента a, b и с.
Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран.
При этом возможны следующие варианты:
  Если D > 0, то выводим дискриминант и 2 корня
  Если D = 0, то выводим дискриминант и 1 корень (т.к. они в этом случае равны)
  Если D < 0, то выводим дискриминант и сообщение \"Корней нет\"
Подсказки: Вот здесь описан алгоритм решения с блок-схемой.
Для вычисления квадратного корня, нужно использовать `Math.sqrt`, например, `Math.sqrt(16)` вернет 4, т.е. квадратный корень из 16."

puts "Enter a, b, c"
data_input = gets.chomp.split
a = data_input[0].to_i
b = data_input[1].to_i
c = data_input[2].to_i

D = b**2 - 4*a*c

if D > 0
  x1 = (-b - Math.sqrt(D))/(2*a)
  x2 = (-b + Math.sqrt(D))/(2*a)
  puts "D = #{D}, x1 = #{x1.round(2)}, x2 = #{x2.round(2)}"
elsif D == 0
  x1 = (-b - Math.sqrt(D))/(2*a)
  puts "D = #{D}, x = #{x1.round(2)}"
else
  puts "Корней нет..."
end


