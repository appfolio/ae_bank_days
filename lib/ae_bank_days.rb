# frozen_string_literal: true

require 'ae_bank_days/version'
require 'holidays'
require 'active_support'
require 'active_support/core_ext/time'
require 'active_support/core_ext/integer/time'

module AeBankDays
  class BankDayHelper
    ten_years_from_now = Time.now + 10.years
    HOLIDAYS = Holidays.between(Date.civil(2014, 1, 1), ten_years_from_now, :federalreserve, :observed).map do |holiday|
      holiday[:date]
    end

    class << self
      def bank_day?(day)
        date = day.to_date
        weekday?(date) && !HOLIDAYS.include?(date)
      end

      def next_banking_day(date, number_of_days: 0)
        banking_day = date
        number_of_days.times do
          banking_day += 1 until bank_day?(banking_day)
          banking_day += 1
        end
        banking_day += 1 until bank_day?(banking_day)
        banking_day
      end

      def previous_banking_day(date, number_of_days: 0)
        banking_day = date
        number_of_days.times do
          banking_day -= 1 until bank_day?(banking_day)
          banking_day -= 1
        end
        banking_day -= 1 until bank_day?(banking_day)
        banking_day
      end

      private

      def weekday?(day)
        [1, 2, 3, 4, 5].include? day.wday
      end
    end
  end
end
