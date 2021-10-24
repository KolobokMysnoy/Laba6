# frozen_string_literal: true

def first_function
  ->(x) { (x * x) + Math.sin(x / 2) }
end

def second_function
  proc { |x| Math.atan(x) + x - 1 }
end

def root(start, stop, check, &function)
  centre = (start + stop) / 2
  result = (start + stop) / 2
  if (function.call(stop) - function.call(start)).abs > check
    result = if (function.call(stop) * function.call(centre)).negative?
               root(centre, stop, check, &function)
             else
               root(start, centre, check, &function)
             end
  end
  result
end

def root_setup(start, stop, check, choose_function)
  if (start.to_s.scan(/\d/).empty? || stop.to_s.scan(/\d/).empty? || check.to_s.scan(/\d/).empty? ||
         choose_function.to_s.scan(/\d/).empty?)
  
    return nil
  end
  
  function = if choose_function.to_s.scan(/\d/).join('').to_i == 1
               first_function
             else
               second_function
             end

  start=start.to_s.scan(/\d|[-.]/).join('').to_f
  stop=stop.to_s.scan(/\d|[-.]/).join('').to_f
  check=check.to_s.scan(/\d|[-.]/).join('').to_f
    
  root(start.to_f, stop.to_f, check, &function)
end
