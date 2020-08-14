# frozen_string_literal: true

require 'date'
require 'holidays'

module AeBankDays
  autoload :BankDayHelper, 'ae_bank_days/bank_day_helper'
  autoload :DateExtensions, 'ae_bank_days/date_extensions'
end

Date.send :include, AeBankDays::DateExtensions
