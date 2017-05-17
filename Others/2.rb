def caps(str)
  str.capitalize!
  yield(str)
end

caps('abc') { |str| puts str[0] }



def caps(str, &block)
  str.capitalize!
  block.call(str)
end

caps('abc') { |x| puts x }

puts '*********'

def m(str, &block)
  if block_given?
    yield(str)
  else
    puts str
  end
end

m('abc') { |x| x.capitalize!; puts x }

puts
puts '*****'
puts

block  = lambda {|str| puts str}
block2 = ->(x) { puts x }

block.call('qwer')
block2.call('qwert')

@train = [1, 2, 3, 4, 'abcd']

def each_train(&block)
  @train.each {|train| block.call(train)}
  @train.each {|train| yield(train)}
end

each_train {|train| puts train}