require '.\laba6_3.rb'
puts 'Choose your function';
puts '1:x^2 + sin (x/2) = 0';
puts '2: arctg(x) + x = 1';
indicator= gets.to_i;
p' In'
start=gets.to_f;
stop=gets.to_f;
p root_setup(start, stop, 0.0001, indicator);