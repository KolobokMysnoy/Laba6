# frozen_string_literal: true

class ClassForFunction
  private

  attr_accessor :function, :start, :stop, :check, :centre

  def function_call(param)
    function.call(param)
  end

  def ramification
    if (function_call(stop) * function_call(centre)).negative?
      self.start = centre
    else
      self.stop = centre
    end
    root
  end

  def root
    self.centre = (start + stop).to_f / 2
    result = centre
    func_stop = function_call(stop)
    func_start = function_call(start)

    result = ramification if (func_stop - func_start).abs > check

    result
  end

  def setup
    self.start = start.join.to_f
    self.stop = stop.join.to_f
    self.check = check.join.to_f
  end

  def scans
    self.start = start.to_s.scan(/\d|[-.]/)
    self.stop = stop.to_s.scan(/\d|[-.]/)
    self.check = check.to_s.scan(/\d|[-.]/)
  end

  public

  def init_function(func)
    self.function = func
  end

  def root_setup(start_out, stop_out, check_out)
    self.start = start_out
    self.stop = stop_out
    self.check = check_out
    scans
    return nil if start.empty? || stop.empty? || check.empty?

    setup
    root
  end
end
