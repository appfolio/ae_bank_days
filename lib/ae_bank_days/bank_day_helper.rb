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
        banking_day = date.to_date
        banking_day += 1
        number_of_days.times do
          banking_day = current_or_next_banking_day(banking_day)
          banking_day += 1
        end

        current_or_next_banking_day(banking_day)
      end

      def previous_banking_day(date, number_of_days: 0)
        banking_day = date.to_date
        banking_day -= 1
        number_of_days.times do
          banking_day = current_or_previous_banking_day(banking_day)
          banking_day -= 1
        end

        current_or_previous_banking_day(banking_day)
      end

      def current_or_previous_banking_day(day)
        date = day.to_date
        date -= 1 until bank_day?(date)
        date
      end

      def current_or_next_banking_day(day)
        date = day.to_date
        date += 1 until bank_day?(date)
        date
      end

      private

      def weekday?(day)
        (1..5).include?(day.wday)
      end
    end
  end
end
