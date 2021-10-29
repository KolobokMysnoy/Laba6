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
  end

  def test_1
    x = root_setup(@start1, @stop1, @Check, 1)
    assert_in_delta(0.0, x, @Check)
  end

  def test_2
    x = root_setup(@start2, @stop2, @Check, 2)
    assert_in_delta(0.5202, x, @Check)
  end

  def test_3
    x = root_setup('zzas', @stop1, '@Check', 1)
    assert_nil(x)
  end

  def test_4
    x = root_setup(@start1, 'a', @Check, 1)
    assert_nil(x)
  end
end
