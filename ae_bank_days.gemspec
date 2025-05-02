# frozen_string_literal: true

require_relative 'lib/ae_bank_days/version'

Gem::Specification.new do |spec|
  spec.name          = 'ae_bank_days'
  spec.version       = AeBankDays::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.author        = 'AppFolio'
  spec.email         = 'opensource@appfolio.com'
  spec.description   = 'Gem for finding the next banking date.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/appfolio/ae_bank_days'
  spec.license       = 'MIT'
  spec.files         = Dir['**/*'].select { |f| f[/^(lib\/|LICENSE.txt|.*gemspec)/] }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('< 3.5')
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.add_dependency('holidays', ['>= 8.3', '< 9'])
end
