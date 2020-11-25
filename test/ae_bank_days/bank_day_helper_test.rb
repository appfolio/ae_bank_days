# frozen_string_literal: true

require 'test_helper'

module AeBankDays
  class BankDayHelperTest < Minitest::Test
    def test_bank_day__weekday
      assert BankDayHelper.bank_day?(Date.civil(2017, 10, 3))
    end

    def test_bank_day__weekend
      refute BankDayHelper.bank_day?(Date.civil(2017, 10, 14))
    end

    def test_bank_day__holiday
      refute BankDayHelper.bank_day?(Date.civil(2017, 10, 9))
    end

    def test_bank_day__weekday_time
      assert BankDayHelper.bank_day?(Time.new(2017, 10, 3))
    end

    def test_bank_day__saturday_holiday_is_not_observed_on_friday
      # The federal bank does not observe holidays that fall on Saturday on the preceding Friday as is common.
      # This test makes sure that these dates are not accidentally marked as holidays.
      # July 4, 2020 fell on a Saturday. The day before was a generally observed federal holiday, but it was still
      # a banking day due to the federal banks holiday rules.
      assert BankDayHelper.bank_day?(Date.civil(2020, 6, 3))
    end

    def test_next_banking_day__weekday
      assert_equal Date.civil(2017, 10, 3), BankDayHelper.next_banking_day(Date.civil(2017, 10, 3))
    end

    def test_next_banking_day__weekday__extra_days
      assert_equal Date.civil(2017, 10, 6), BankDayHelper.next_banking_day(Date.civil(2017, 10, 3), number_of_days: 3)
    end

    def test_next_banking_day__weekend
      assert_equal Date.civil(2017, 10, 16), BankDayHelper.next_banking_day(Date.civil(2017, 10, 14))
    end

    def test_next_banking_day__weekend__extra_days
      assert_equal Date.civil(2017, 10, 19), BankDayHelper.next_banking_day(Date.civil(2017, 10, 14), number_of_days: 3)
    end

    def test_next_banking_day__holiday
      assert_equal Date.civil(2017, 10, 10), BankDayHelper.next_banking_day(Date.civil(2017, 10, 9))
    end

    def test_next_banking_day__holiday__extra_days
      assert_equal Date.civil(2017, 10, 13), BankDayHelper.next_banking_day(Date.civil(2017, 10, 9), number_of_days: 3)
    end

    def test_previous_banking_day__weekday
      assert_equal Date.civil(2017, 10, 3), BankDayHelper.previous_banking_day(Date.civil(2017, 10, 3))
    end

    def test_previous_banking_day__weekday__extra_days
      assert_equal Date.civil(2017, 10, 3), BankDayHelper.previous_banking_day(Date.civil(2017, 10, 6), number_of_days: 3)
    end

    def test_previous_banking_day__weekend
      assert_equal Date.civil(2017, 10, 13), BankDayHelper.previous_banking_day(Date.civil(2017, 10, 14))
    end

    def test_previous_banking_day__weekend__extra_days
      assert_equal Date.civil(2017, 10, 10), BankDayHelper.previous_banking_day(Date.civil(2017, 10, 14), number_of_days: 3)
    end

    def test_previous_banking_day__holiday
      assert_equal Date.civil(2017, 10, 6), BankDayHelper.previous_banking_day(Date.civil(2017, 10, 9))
    end

    def test_previous_banking_day__holiday__extra_days
      assert_equal Date.civil(2017, 10, 3), BankDayHelper.previous_banking_day(Date.civil(2017, 10, 9), number_of_days: 3)
    end

    def test_current_or_previous_banking_day
      date = Date.new(2016, 1, 21)
      assert_equal date, BankDayHelper.current_or_previous_banking_day(date)

      date = Date.new(2016, 1, 17)
      assert_equal Date.new(2016, 1, 15), BankDayHelper.current_or_previous_banking_day(date)
    end

    def test_current_or_next_banking_day
      date = Date.new(2016, 1, 21)
      assert_equal date, BankDayHelper.current_or_next_banking_day(date)

      date = Date.new(2016, 1, 17)
      assert_equal Date.new(2016, 1, 19), BankDayHelper.current_or_next_banking_day(date)
    end
  end
end
