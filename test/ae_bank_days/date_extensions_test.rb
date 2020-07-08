# frozen_string_literal: true

require 'test_helper'

module AeBankDays
  class DateExtensionsTest < Minitest::Test
    def test_bank_day
      date = Date.today
      BankDayHelper.expects(:bank_day?).with(date).returns(true)

      assert date.bank_day?
    end

    def test_next_banking_day
      date = Date.today
      new_date = date + 2
      BankDayHelper.expects(:next_banking_day).with(date, number_of_days: 2).returns(new_date)

      assert_equal new_date, date.next_banking_day(2)
    end

    def test_next_banking_day__default
      date = Date.today
      new_date = date + 2
      BankDayHelper.expects(:next_banking_day).with(date, number_of_days: 0).returns(new_date)

      assert_equal new_date, date.next_banking_day
    end

    def test_previous_banking_day
      date = Date.today
      new_date = date + 2
      BankDayHelper.expects(:previous_banking_day).with(date, number_of_days: 2).returns(new_date)

      assert_equal new_date, date.previous_banking_day(2)
    end

    def test_previous_banking_day__default
      date = Date.today
      new_date = date + 2
      BankDayHelper.expects(:previous_banking_day).with(date, number_of_days: 0).returns(new_date)

      assert_equal new_date, date.previous_banking_day
    end
  end
end
