# frozen_string_literal: true

class ClassForPerimetrs
  private

  attr_accessor :number_of_sides, :radius, :radius_two, :accuracy, :side

  def length_of_side
    self.radius_two = radius**2
    Math.sqrt((2 * radius_two) - (2 * radius * Math.sqrt(radius_two - ((side**2) / 4))))
  end

  def strings
    (accuracy.to_s.scan(/^\d/).empty? || radius.to_s.scan(/^\d/).empty? || number_of_sides.to_s.scan(/^\d/).empty?)
  end

  def setup
    self.side = 2 * radius * Math.sin(Math::PI / number_of_sides)
  end

  def perimetr
    number_sides = number_of_sides
    now = 1
    prev = 0
    (1..(1.0 / 0.0)).cycle do
      break unless (now - prev) > accuracy

      prev = now
      now = number_sides * side
      number_sides *= 2
      self.side = length_of_side
    end
    now
  end

  public

  def search_for_perimetr(radius_out, accuracy_out, number_of_sides_out)
    self.number_of_sides = number_of_sides_out
    self.accuracy = accuracy_out
    self.radius = radius_out

    return nil if strings

    self.number_of_sides = number_of_sides.to_f
    self.radius = radius.to_f
    self.accuracy = accuracy.to_f

    setup
    perimetr
  end
end
