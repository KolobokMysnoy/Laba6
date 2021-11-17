# frozen_string_literal: true

require './part1/main.rb'
require 'minitest/autorun'

# Error from reek.
# Standart doesn't depend on instance state
# Это нужно исправлять?

def standart(radius)
  2 * Math::PI * radius
end

ACCURACY_ONE = 1 * (10**-3)
ACCURACY_TWO = 1 * (10**-4)
ACCURACY_TO_TEST = 0.01
NUMBER_OF_SIDES = 6

class Labaest < Minitest::Test
  def setup
    @results_needed = []
    @results_for_first = []
    @results_for_second = []
    100.times.map do
      radius = Random.rand(120)
      results_for_first.push(ComputePerimeter.execute(radius, ACCURACY_ONE, NUMBER_OF_SIDES))
      results_for_second.push(ComputePerimeter.execute(radius, ACCURACY_TWO, NUMBER_OF_SIDES))
      results_needed.push(standart(radius))
    end
  end

  def test_with_first_accuracy
    100.times { |index| assert_in_delta(results_for_first[index], results_needed[index], ACCURACY_ONE) }
  end

  def test_with_second_accuracy
    100.times { |index| assert_in_delta(results_for_second[index], results_needed[index], ACCURACY_TWO) }
  end

  def test_length_of_side
    assert_in_delta LengthOfSide.length_of_side(27, 2 * 27 * Math.sin(Math::PI / 6)), 13.98, ACCURACY_TO_TEST
  end

  def test_without_length_of_side
    # Stub method

    # Value to return instead of length_of_side
    return_val = [4.141104721640333, 2.0884190755208247, 1.0464500676822908,
                  0.5235053251484216, 0.2617877060237787, 0.13089823366298425, 0.0654496644197695,
                  0.03272490065871627]

    LengthOfSide.stub :length_of_side, (proc { |_a| return_val.shift }) do
      assert_in_delta ComputePerimeter.execute(8, ACCURACY_TO_TEST, NUMBER_OF_SIDES), standart(8), ACCURACY_TO_TEST
    end
  end

  attr_reader :results_needed, :results_for_first, :results_for_second
end
