require './enumerable.rb'
test_array1 = [11, 2, 3, 56]

test_array2 = %w[a b c d]

# my_each

p 'my_each'

test_array1.my_each { |x| p x }

test_array2.my_each { |x| p x }

p test_array2.my_each

array = [1, 2, 3, 5, 1, 7, 3, 4, 5, 7, 2, 3, 2, 0, 8, 8, 7, 8, 1, 6, 1, 1, 7, 2, 1, 2, 5, 8, 6, 0, 4, 5, 8, 2, 2, 5, 4, 7, 3, 4, 3, 3, 8, 5, 1, 0, 3, 7, 5, 5, 7, 2, 6, 7, 7, 0, 4, 4, 0, 2, 0, 6, 6, 8, 1, 6, 8, 6, 2, 3, 6, 1, 5, 2, 6, 7, 2, 5, 8, 2, 0, 7, 3, 2, 3, 6, 1, 2, 8, 3, 7, 0, 5, 0, 0, 2, 6, 1, 5, 2]

my_each_output = ''

block = proc { |num| my_each_output += num.to_s }

array.my_each(&block)

p my_each_output

# my_each_with_index

p 'my_each-with_index'

test_array1.my_each_with_index { |x, y| p "item: #{x}, index: #{y}" }

p test_array2.my_each_with_index
