# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер
# буквы в алфавите (a - 1).
glasnie_array = {}
nomer = 0
glasnie = ["e", "y", "u", "i", "o", "a"]
("a".."z").each do |bukva|
  nomer += 1
  glasnie_array[bukva] = nomer if glasnie.include? (bukva)
end
p glasnie_array



# Нужное решение:
=begin

alph = ('a'..'z')
vowels = {}

alph.each_with_index do |key, index|
  vowels[key] = index + 1 if %w(a e o u i).include?(key)
end

p vowels

=end