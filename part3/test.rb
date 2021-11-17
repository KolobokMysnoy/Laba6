# frozen_string_literal: true

require './laba6_3'
require 'minitest/autorun'

CHECK= 1e-4

class Task2_test < Minitest::Test
  def setup
    # Start and stop for lambda function
    @start_for_lambda=-0.5
    @stop_for_lambda=55.0

    # Start and stop for block function
    @start_for_block = 0.0
    @stop_for_block = 2.0

  end
  
  def test_lambda_function
    assert_in_delta 0, root(start_for_lambda,stop_for_lambda,&proc{|x| x*x+Math.sin(x/2)}),CHECK
  end

  def test_block_fun
    assert_in_delta root(start_for_block,stop_for_block) { |x| Math.atan(x) + x - 1 }, 0.5203, CHECK
  end

  attr_reader :start_for_block, :start_for_lambda,
  :stop_for_block, :stop_for_lambda;
end