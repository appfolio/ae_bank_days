module AeBankDays
  module DateExtensions
    def bank_day?
      BankDayHelper.bank_day?(self)
    end

    def next_banking_day(n = 0)
      BankDayHelper.next_banking_day(self, number_of_days: n)
    end

    def previous_banking_day(n = 0)
      BankDayHelper.previous_banking_day(self, number_of_days: n)
    end
  end
end
