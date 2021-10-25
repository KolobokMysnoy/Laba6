# frozen_string_literal: true

def standart(radius)
  2 * Math::PI * radius
end

def length_of_side(previous_length, radius)
  Math.sqrt((2 * (radius**2)) - (2 * radius * Math.sqrt((radius**2) - ((previous_length**2) / 4))))
end

def search_for_perimetr(radius, accuracy, number_of_sides)
  return nil if accuracy.to_s.scan(/^\d/).empty? || radius.to_s.scan(/^\d/).empty? || number_of_sides.to_s.scan(/^\d/).empty?

  number_of_sides = number_of_sides.to_f
  radius = radius.to_f
  accuracy = accuracy.to_f
  perimetr(number_of_sides, accuracy, radius)
end

def perimetr(number_of_sides, accuracy, radius)
  now = 1
  prev = 0
  side = 2 * radius * Math.sin(Math::PI / number_of_sides)
  (1..(1.0 / 0.0)).cycle do
    break unless (now - prev) > accuracy

    prev = now
    now = number_of_sides * side
    number_of_sides *= 2
    side = length_of_side(side, radius)
  end
  now
end
