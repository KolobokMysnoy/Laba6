# frozen_string_literal: true

require './laba6_1'
require 'minitest/autorun'

class Laba6_1_test < Minitest::Test
  def setup
    @Accuracy_1 = 1 * (10**-3)
    @Accuracy_2 = 1 * (10**-4)
    @number_of_sides = 6
    @radiuses = 100.times.map { Random.rand(120) }
    @results_needed = []
    @results = []
  end

  def test_1
    (@radiuses.each { |radius| @results_needed.push(standart(radius)); })
    (@radiuses.each { |radius| @results.push(search_for_perimetr(radius, @Accuracy_1, @number_of_sides)); })
    @results_needed.each_with_index { |element, index| assert_in_delta(element, @results[index], @Accuracy_1) }
  end

  def test_2
    (@radiuses.each { |radius| @results_needed.push(standart(radius)); })
    (@radiuses.each { |radius| @results.push(search_for_perimetr(radius, @Accuracy_2, @number_of_sides)); })
    @results_needed.each_with_index { |element, index| assert_in_delta(element, @results[index], @Accuracy_2) }
  end

  def test_3
    assert_nil(search_for_perimetr('a', 1, 2))
    assert_nil(search_for_perimetr(1, 'a', 2))
    assert_nil(search_for_perimetr(1, 1, 'a2'))
  end
end
