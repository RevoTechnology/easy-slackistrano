# frozen_string_literal: true
Gem::Specification.new do |gem|
  gem.name          = 'slackistrano-messages'
  gem.version       = '0.3.0'
  gem.summary       = 'Alternative messages for Slackistrano.'
  gem.description   = 'Short Slackistrano messages respecting user name from builds and Git.'
  gem.homepage      = 'https://gitlab.rambler.ru/rds/slackistrano-messages'

  gem.license       = 'RDS EULA'

  gem.author        = 'RDS Ruby'
  gem.email         = 'rds_ruby@rambler-co.ru'

  gem.metadata['allowed_push_host'] = 'http://ramblergems.park.rambler.ru'

  gem.files         = `git ls-files -z`.split("\x0")
  gem.require_path  = 'lib'

  gem.add_runtime_dependency 'slackistrano', '>= 2.0.0'

  gem.add_development_dependency 'rubocop', '>= 0.36.0'
end
