# Заполнить массив числами фибоначи до 100
array_fibonachi = [0, 1, 1]
loop do
  chislo_fibonachi = array_fibonachi[-1] + array_fibonachi[-2]
  chislo_fibonachi <= 100 ? array_fibonachi << chislo_fibonachi : break
end
p array_fibonachi



# Нужное решение:
=begin

fib = []
fib[0] = 0
fib[1] = 1
i = 1

while fib[i] < 100 - fib[i - 1]
  i += 1
  fib[i] = fib[i - 1] + fib[i - 2]
end
p fib

=end