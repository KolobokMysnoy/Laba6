require './laba6_2.rb'

p 'Input your radius';
radius=gets.to_f;
puts 'Choose your accuracy'
puts '1: 0.001';
puts '2: 0.0001';
indicator=gets.to_i;
if (indicator==1) then
    accuracy=0.001;
else
    accuracy=0.0001;
end

p perimetr(6, accuracy, radius)