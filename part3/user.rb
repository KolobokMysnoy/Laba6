# frozen_string_literal: true

require './part3/main.rb'

puts 'Choose your function'
puts '1:x^2 + sin (x/2) = 0'
puts '2: arctg(x) + x = 1'

choose = gets.to_f

p 'Write start and stop'
start = gets.to_f
stop = gets.to_f

if choose == 1
  p root(start, stop, &proc { |x| (x * x) + Math.sin(x / 2) })
else
  p root(start, stop) { |x| Math.atan(x) + x - 1 }
end