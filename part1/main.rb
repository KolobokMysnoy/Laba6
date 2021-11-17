# frozen_string_literal: true

class ComputePerimeter
  # Взял то, что вы предложили

  class << self
    def execute(radius_out, accuracy_out, number_of_sides_out)
      new(radius_out, accuracy_out, number_of_sides_out).send :execute
    end
  end

  private

  attr_accessor :number_of_sides, :radius, :radius_two, :accuracy, :side

  def initialize(radius_out, accuracy_out, number_of_sides_out)
    @number_of_sides = number_of_sides_out
    @accuracy = accuracy_out
    @radius = radius_out
    @side = 2 * radius * Math.sin(Math::PI / number_of_sides)
  end

  def execute
    # Method where we find perimetr
    now = 1
    prev = 0
    while now - prev > accuracy
      prev = now
      now = number_of_sides * side
      # Если не ставить тут self, то у меня выдаёт ошибку
      self.number_of_sides *= 2
      self.side = LengthOfSide.length_of_side(radius, side)
    end
    now
  end
end

class LengthOfSide
  class << self
    def length_of_side(radius_out, side_out)
      new(radius_out, side_out).send :length_of_side
    end
  end

  private

  def initialize(radius, side)
    @side = side
    @radius = radius
    @radius_two = radius**2
  end

  def length_of_side
    Math.sqrt((2 * radius_two) - (2 * radius * Math.sqrt(radius_two - ((side**2) / 4))))
  end

  attr_accessor :side, :radius, :radius_two
end
