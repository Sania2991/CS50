puts "Text please: "
text = gets.chomp.split(" ")

histogram = {0}
text.each do |word|
  histogram[word] += 1
end

histogram.each { |key, value| puts "#{key} #{value}" }
