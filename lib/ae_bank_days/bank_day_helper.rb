# frozen_string_literal: true

module AeBankDays
  class BankDayHelper
    class << self
      Holidays.cache_between(Date.today.prev_year, Date.today.next_year(10), :federalreservebanks, :observed)

      def bank_day?(day)
        date = day.to_date
        weekday?(date) && Holidays.on(date, :federalreservebanks, :observed).empty?
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
        (1..5).include?(day.wday)
      end
    end
  end
end
