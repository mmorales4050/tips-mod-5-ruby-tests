require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    counter = @interval
    current = @start

    while current <= date
      if current == date
        return true
      end

      if @period == 'monthly'
        current = @start.advance(months: @interval)
        if current != @start.advance(months: counter)
          current = @start.advance(months: counter)
        end
      elsif @period == 'weekly'
        current = current.advance(weeks: @interval)
      elsif @period == 'daily'
        current = current.advance(days: @interval)
      end
      counter += @interval
    end

    return false
  end
end
