# работа с исключениями начинается с begin-end
begin
  puts 'Before exeption'
   1/0  # после этой ошибки - прерывается выполн. и отправл. в rescue
  puts 'After execption'
rescue
  # код, который обрабатывает исключение
  puts "You can't do that!"
end