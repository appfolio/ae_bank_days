# frozen_string_literal: true

require 'test_helper'

module AeBankDays
  class BankDayHelperTest < Minitest::Test
    def test_constants
      assert_equal Date.civil(2014, 1, 1), BankDayHelper::START_DATE
      assert_equal Date.today.next_year(10), BankDayHelper::END_DATE
      assert BankDayHelper::HOLIDAYS.any?
    end

    def test_bank_day__weekday
      time = Time.parse('2017-10-03 14:30:45 -0500')
      assert BankDayHelper.bank_day?(time.to_date)
    end

    def test_bank_day__weekend
      time = Time.parse('2017-10-14 14:30:45 -0500')
      refute BankDayHelper.bank_day?(time.to_date)
    end

    def test_bank_day__holiday
      time = Time.parse('2017-10-09 14:30:45 -0500')
      refute BankDayHelper.bank_day?(time.to_date)
    end

    def test_bank_day__saturday_holiday_is_not_observed_on_friday
      # The federal bank does not observe holidays that fall on Saturday on the preceding Friday as is common.
      # This test makes sure that these dates are not accidentally marked as holidays.
      # July 4, 2020 fell on a Saturday. The day before was a generally observed federal holiday, but it was still
      # a banking day due to the federal banks holiday rules.
      time = Time.parse('2020-07-03 14:30:45 -0500')
      assert BankDayHelper.bank_day?(time.to_date)
    end

    def test_next_banking_day__weekday
      time = Time.parse('2017-10-03 14:30:45 -0500')
      assert_equal Date.parse('2017-10-03'), BankDayHelper.next_banking_day(time.to_date)
    end

    def test_next_banking_day__weekday__extra_days
      time = Time.parse('2017-10-03 14:30:45 -0500')
      assert_equal Date.parse('2017-10-06'), BankDayHelper.next_banking_day(time.to_date, number_of_days: 3)
    end

    def test_next_banking_day__weekend
      time = Time.parse('2017-10-14 14:30:45 -0500')
      assert_equal Date.parse('2017-10-16'), BankDayHelper.next_banking_day(time.to_date)
    end

    def test_next_banking_day__weekend__extra_days
      time = Time.parse('2017-10-14 14:30:45 -0500')
      assert_equal Date.parse('2017-10-19'), BankDayHelper.next_banking_day(time.to_date, number_of_days: 3)
    end

    def test_next_banking_day__holiday
      time = Time.parse('2017-10-09 14:30:45 -0500')
      assert_equal Date.parse('2017-10-10'), BankDayHelper.next_banking_day(time.to_date)
    end

    def test_next_banking_day__holiday__extra_days
      time = Time.parse('2017-10-09 14:30:45 -0500')
      assert_equal Date.parse('2017-10-13'), BankDayHelper.next_banking_day(time.to_date, number_of_days: 3)
    end

    def test_previous_banking_day__weekday
      time = Time.parse('2017-10-03 14:30:45 -0500')
      assert_equal Date.parse('2017-10-03'), BankDayHelper.previous_banking_day(time.to_date)
    end

    def test_previous_banking_day__weekday__extra_days
      time = Time.parse('2017-10-06 14:30:45 -0500')
      assert_equal Date.parse('2017-10-03'), BankDayHelper.previous_banking_day(time.to_date, number_of_days: 3)
    end

    def test_previous_banking_day__weekend
      time = Time.parse('2017-10-14 14:30:45 -0500')
      assert_equal Date.parse('2017-10-13'), BankDayHelper.previous_banking_day(time.to_date)
    end

    def test_previous_banking_day__weekend__extra_days
      time = Time.parse('2017-10-14 14:30:45 -0500')
      assert_equal Date.parse('2017-10-10'), BankDayHelper.previous_banking_day(time.to_date, number_of_days: 3)
    end

    def test_previous_banking_day__holiday
      time = Time.parse('2017-10-09 14:30:45 -0500')
      assert_equal Date.parse('2017-10-06'), BankDayHelper.previous_banking_day(time.to_date)
    end

    def test_previous_banking_day__holiday__extra_days
      time = Time.parse('2017-10-09 14:30:45 -0500')
      assert_equal Date.parse('2017-10-03'), BankDayHelper.previous_banking_day(time.to_date, number_of_days: 3)
    end
  end
end
