# frozen_string_literal: true

require 'minitest/autorun'
require 'ae_bank_days'

module AeBankDays
  class BankDayHelperTest < ActiveSupport::TestCase
    def test_constant
      refute AeBankDays::BankDayHelper::HOLIDAYS.empty?
    end

    def test_bank_day__weekday
      time = Time.parse('2017-10-03 14:30:45 -0500')
      assert AeBankDays::BankDayHelper.bank_day?(time.to_date)
    end

    def test_bank_day__weekend
      time = Time.parse('2017-10-14 14:30:45 -0500')
      refute AeBankDays::BankDayHelper.bank_day?(time.to_date)
    end

    def test_bank_day__holiday
      time = Time.parse('2017-10-09 14:30:45 -0500')
      refute AeBankDays::BankDayHelper.bank_day?(time.to_date)
    end

    def test_next_banking_day__weekday
      time = Time.parse('2017-10-03 14:30:45 -0500')
      assert_equal Date.parse('2017-10-03'), AeBankDays::BankDayHelper.next_banking_day(time.to_date)
    end

    def test_next_banking_day__weekend
      time = Time.parse('2017-10-14 14:30:45 -0500')
      assert_equal Date.parse('2017-10-16'), AeBankDays::BankDayHelper.next_banking_day(time.to_date)
    end

    def test_next_banking_day__holiday
      time = Time.parse('2017-10-09 14:30:45 -0500')
      assert_equal Date.parse('2017-10-10'), AeBankDays::BankDayHelper.next_banking_day(time.to_date)
    end
  end
end
