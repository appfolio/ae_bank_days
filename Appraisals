# frozen_string_literal: true

case RUBY_VERSION
when '2.6.9', '2.7.5', '3.1.1'
  appraise "ruby-#{RUBY_VERSION}" do
    # default configuration
  end
else
  raise "Unsupported Ruby version #{RUBY_VERSION}"
end
