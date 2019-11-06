# frozen_string_literal: true

require 'minitest/autorun'
require 'ae_bank_days'

module AeBankDays
  class WorkdayHelperTest < ActiveSupport::TestCase
    def test_constant
      assert !AeBankDays::WorkdayHelper::HOLIDAYS.empty?
    end

    def test_workday__weekday
      time = Time.parse('2017-10-03 14:30:45 -0500')
      assert AeBankDays::WorkdayHelper.workday?(time.to_date)
    end

    def test_workday__weekend
      time = Time.parse('2017-10-14 14:30:45 -0500')
      assert !AeBankDays::WorkdayHelper.workday?(time.to_date)
    end

    def test_workday__holiday
      time = Time.parse('2017-10-09 14:30:45 -0500')
      assert !AeBankDays::WorkdayHelper.workday?(time.to_date)
    end

    def test_next_banking_day__weekday
      time = Time.parse('2017-10-03 14:30:45 -0500')
      assert_equal Date.parse('2017-10-03'), AeBankDays::WorkdayHelper.next_banking_day(time.to_date)
    end

    def test_next_banking_day__weekend
      time = Time.parse('2017-10-14 14:30:45 -0500')
      assert_equal Date.parse('2017-10-16'), AeBankDays::WorkdayHelper.next_banking_day(time.to_date)
    end

    def test_next_banking_day__holiday
      time = Time.parse('2017-10-09 14:30:45 -0500')
      assert_equal Date.parse('2017-10-10'), AeBankDays::WorkdayHelper.next_banking_day(time.to_date)
    end
  end
end
