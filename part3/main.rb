# frozen_string_literal: true

def root(start_point, stop_point)
  # Main function that search for root
  return nil unless block_given?

  start = start_point
  stop = stop_point

  loop do
    centre = (start + stop) / 2

    # function results
    fc_stop = yield(stop)
    fc_start = yield(start)
    fc_centre = yield(centre)

    if (fc_centre * fc_stop).negative?
      start = centre
    else
      stop = centre
    end

    # check for exit
    return centre if (fc_stop - fc_start).abs <= 1e-5
  end
end
