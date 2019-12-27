# frozen_string_literal: true

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'ae_bank_days'
require 'minitest/autorun'
require 'minitest/reporters'
require 'time'

MiniTest::Reporters.use!
