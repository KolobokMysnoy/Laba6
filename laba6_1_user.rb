# frozen_string_literal: true

require './laba6_1'

p 'Input your radius'
radius = gets.to_f
puts 'Choose your accuracy'
puts '1: 0.001'
puts '2: 0.0001'
indicator = gets.to_i
accuracy = if indicator == 1
             0.001
           else
             0.0001
           end

classy = ClassForPerimetrs.new
p classy.search_for_perimetr(radius, accuracy, 6)
