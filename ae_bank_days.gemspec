# frozen_string_literal: true

require_relative 'lib/ae_bank_days/version'

Gem::Specification.new do |spec|
  spec.name                  = 'ae_bank_days'
  spec.version               = AeBankDays::VERSION
  spec.platform              = Gem::Platform::RUBY
  spec.authors               = ['AppFolio']
  spec.email                 = ['dev@appfolio.com']
  spec.summary               = 'Gem for finding the next banking date'
  spec.description           = spec.summary
  spec.homepage              = 'https://github.com/appfolio/ae_bank_days'
  spec.required_ruby_version = '>= 2.3.3'
  spec.licenses              = ['MIT']
  spec.files                 = Dir['**/*'].select { |f| f[%r{^(lib/|Gemfile$|Rakefile|README.md|.*gemspec)}] }
  spec.test_files            = spec.files.grep(%r{^(test)/})
  spec.require_paths         = ['lib']

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.add_dependency('holidays', '~> 8.3')
end
