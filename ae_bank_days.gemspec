# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ae_bank_days/version'

Gem::Specification.new do |spec|
  spec.name          = 'ae_bank_days'
  spec.version       = AeBankDays::VERSION
  spec.authors       = ['AppFolio']
  spec.email         = ['dev@appfolio.com']
  spec.summary       = 'Gem for finding the next banking date'
  spec.description   = ''
  spec.homepage      = 'http://github.com/appfolio/ae_bank_days'
  spec.required_ruby_version = ['>= 2.3.3', '< 2.7']
  spec.licenses      = ['MIT']
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files         = Dir['**/*'].reject { |f| f[%r{^log/}] || f[%r{^pkg/}] }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'holidays', '~> 7.1'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'bundler', ['>= 1.10.4', '< 2.1']
end
