# frozen_string_literal: true

require './laba6_3'
require 'minitest/autorun'

class Task2_test < Minitest::Test
  def setup
    @Check = 1e-4

    @start1 = -0.5
    @stop1 = 55.0

    @start2 = -1.0
    @stop2 = 15.0

    @classy = ClassForFunction.new
  end

  def first_function
    ->(x) { (x * x) + Math.sin(x / 2) }
  end

  def second_function
    proc { |x| Math.atan(x) + x - 1 }
  end

  def test_1
    @classy.init_function(first_function)
    x = @classy.root_setup(@start1, @stop1, @Check)
    assert_in_delta(0.0, x, @Check)
  end

  def test_2
    @classy.init_function(second_function)
    x = @classy.root_setup(@start2, @stop2, @Check)
    assert_in_delta(0.5202, x, @Check)
  end

  def test_3
    @classy.init_function(second_function)
    x = @classy.root_setup('zzas', @stop1, '@Check')
    assert_nil(x)
  end

  def test_4
    @classy.init_function(second_function)
    x = @classy.root_setup(@start1, 'a', @Check)
    assert_nil(x)
  end
end
