# Slackistrano::Messages

[![build status: master](https://gitlab-ci.park.rambler.ru/projects/87/status.png?ref=master)](https://gitlab-ci.park.rambler.ru/projects/87?ref=master)

Short Slackistrano messages respecting user name from builds and Git.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'slackistrano-messages', source: 'http://ramblergems.park.rambler.ru/'
```

And then execute:

```
bundle install
```

## Usage

```ruby
# Capfile
require 'slackistrano/messages'

# config/deploy.rb
set :slack_webhook, 'https://hooks.slack.com/services/XXX/XXX/XXX'
```

## Options

```ruby
# config/deploy.rb
set :slack_app_name, -> { 'Ed' }
set :slack_icon_emoji, -> { ':pencil2_monochrome:' }

# config/deploy/production.rb
set :slack_icon_emoji, -> { ':pencil2:' }
```
