# frozen_string_literal: true

require '.\laba6_3'
def first_function
  ->(x) { (x * x) + Math.sin(x / 2) }
end

def second_function
  proc { |x| Math.atan(x) + x - 1 }
end

puts 'Choose your function'
puts '1:x^2 + sin (x/2) = 0'
puts '2: arctg(x) + x = 1'
function = if  gets.to_i == 1
             first_function
           else
             second_function
           end

p 'Write start and stop'
start = gets.to_f
stop = gets.to_f

classy = ClassForFunction.new
p classy.init_function(function)
p classy.root_setup(start, stop, 0.0001)
