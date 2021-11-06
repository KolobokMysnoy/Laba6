# frozen_string_literal: true

require '.\laba6_3'
def first_function
  ->(x) { (x * x) + Math.sin(x / 2) }
end

puts 'Choose your function'
puts '1:x^2 + sin (x/2) = 0'
puts '2: arctg(x) + x = 1'

classy = ClassForFunction.new
if gets.to_i == 1
  classy.init_function(&first_function)
else
  classy.init_function { |x| Math.atan(x) + x - 1 }
end

p 'Write start and stop'
start = gets.to_f
stop = gets.to_f

p classy.root_setup(start, stop, 0.0001)
