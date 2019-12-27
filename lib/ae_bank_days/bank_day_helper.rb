# frozen_string_literal: true

module AeBankDays
  class BankDayHelper
    START_DATE = Date.civil(2014, 1, 1)
    END_DATE   = Date.today.next_year(10)
    HOLIDAYS   = Holidays.between(START_DATE, END_DATE, :federalreserve, :observed).map do |holiday|
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
        (1..5).include?(day.wday)
      end
    end
  end
end
