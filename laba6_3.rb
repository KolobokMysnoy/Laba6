# frozen_string_literal: true

def first_function
  ->(x) { (x * x) + Math.sin(x / 2) }
end

def second_function
  proc { |x| Math.atan(x) + x - 1 }
end

def root(start, stop, check, &function)
  centre = (start + stop) / 2
  result = centre
  func_stop = function.call(stop)
  func_start = function.call(start)
  if (func_stop - func_start).abs > check
    result = if (func_stop * function.call(centre)).negative?
               root(centre, stop, check, &function)
             else
               root(start, centre, check, &function)
             end
  end
  result
end

def root_setup(start, stop, check, choose_function)
  start = start.to_s.scan(/\d|[-.]/)
  stop = stop.to_s.scan(/\d|[-.]/)
  check = check.to_s.scan(/\d|[-.]/)
  choose_function = choose_function.to_s.scan(/\d|[-.]/)

  return nil if start.empty? || stop.empty? || check.empty? || choose_function.empty?

  start = start.join.to_f
  stop = stop.join.to_f
  check = check.join.to_f
  choose_function = choose_function.join.to_i
  function = if choose_function == 1
               first_function
             else
               second_function
             end

  root(start, stop, check, &function)
end
