# frozen_string_literal: true

module AeBankDays
  module DateExtensions
    def bank_day?
      BankDayHelper.bank_day?(self)
    end

    def next_banking_day(number_of_days = 0)
      BankDayHelper.next_banking_day(self, number_of_days: number_of_days)
    end

    def previous_banking_day(number_of_days = 0)
      BankDayHelper.previous_banking_day(self, number_of_days: number_of_days)
    end
  end
end
