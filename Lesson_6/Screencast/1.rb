# def method_with_error
#   #.....
#   raise ArgumentError, "Oh no!"
# end

# begin
#   method_with_error
# rescue RuntimeError => e
#   puts e.inspect
# end

# puts "After exception"
# ----------------------------------------
# # В методах begin и end не пишем!
# def sqrt(value)
#   sqrt = Math.sqrt(value)
#   puts sqrt
# rescue StandardError    #Если есть def - то просто resque (без begin - end)
#   puts "Неверное значение"
# end

# sqrt(-1)
# ----------------------------------------

# Повторное подключение (например без интернета)
def connect_to_wikipedia
  #...
  raise "Connection error"
end

attempt = 0
begin
  connect_to_wikipedia
rescue RuntimeError
  attempt += 1
  puts "Попытка № #{attempt}"
  retry if attempt < 3 # управление передается в begin или начало метода
  puts "Check your internet connection!"
ensure # код, который выполняется в любом случае
  puts "There was #{attempt} attempts"
end