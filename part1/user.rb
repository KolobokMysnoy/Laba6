# frozen_string_literal: true

require './part1/main.rb'

def check_radius(radius)
  Float(radius)
rescue StandardError
  nil
end

p 'Input your radius'
radius = check_radius(gets)
puts 'Choose your accuracy'
puts '1: 0.001'
puts '2: 0.0001'
indicator = gets.to_i
accuracy = if indicator == 1
             0.001
           else
             0.0001
           end

if radius
  p ComputePerimeter.execute(radius, accuracy, 6)
else
  p 'Incorrect input'
end
