# frozen_string_literal: true

require 'ae_bank_days/version'
require 'holidays'
require 'active_support'
require 'active_support/core_ext/time'
require 'active_support/core_ext/integer/time'

module AeBankDays
  class WorkdayHelper
    # second * minutes * days * years
    ten_years_from_now = Time.now + 10.years
    HOLIDAYS = Holidays.between(Date.civil(2014, 1, 1), ten_years_from_now, :federalreserve, :observed).map do |holiday|
      holiday[:date]
    end

    class << self
      def workday?(day)
        date = day.to_date
        weekday?(date) && !HOLIDAYS.include?(date)
      end

      def next_banking_day(date)
        banking_day = date
        banking_day += 1 until workday?(banking_day)
        banking_day
      end

      private

      def weekday?(day)
        [1, 2, 3, 4, 5].include? day.wday
      end
    end
  end
end
