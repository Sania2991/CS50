# работа с исключениями начинается с begin-end
begin
  puts 'Before exeption'
  # 1/0  # после этой ошибки - прерывается выполн. и отправл. в rescue
  Math.sqrt(-1)
rescue StandardError => e
  # код, который обрабатывает исключение
  puts "Exception: #{e.inspect}"
  # puts e.backtrace.inpect #=> массив вызовов backtrace (по умолч.)
rescue NoMemoryError => e
  puts "No memory!!!"
end

puts 'After execption'