puts "  Программа: Идеальный вес.
Программа запрашивает имя и рост и выводит идеальный вес по формуле <рост> - 110, после чего выводит результат пользователю на экран с обращением по имени.
Если идеальный вес получается отрицательным, то выводится строка \"Ваш вес уже оптимальный\" "

puts "What's your name?"
user_name = gets.chomp.capitalize

puts "what is your height?"
user_height = gets.chomp.to_i

user_weigh = user_height - 110

if user_weigh < 0
  puts "Your weigh is perfect"
else
  puts "Your perfect weigh = #{user_weigh} kg"
end