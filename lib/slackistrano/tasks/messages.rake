# frozen_string_literal: true
namespace :load do
  task :defaults do
    set :slack_msg_updating, lambda {
      user = fetch(:slack_deploy_user)
      object = fetch(:slack_deploy_object)
      info = fetch(:slack_deploy_info)
      destination = fetch(:slack_deploy_destination)
      "*#{user}* is deploying *#{object}* (_#{info}_) to *#{destination}*."
    }

    set :slack_msg_updated, lambda {
      user = fetch(:slack_deploy_user)
      destination = fetch(:slack_deploy_destination)
      "*#{user}* deployed to *#{destination}*."
    }

    set :slack_msg_failed, lambda {
      user = fetch(:slack_deploy_user)
      destination = fetch(:slack_deploy_destination)
      "*ERROR!* *#{user}* failed to deploy to *#{destination}*. Oh well..."
    }

    set :slack_deploy_user, lambda {
      return ENV['BUILD_USER'] if ENV['BUILD_USER']

      git_name = `git config --get user.name`.strip
      return git_name unless git_name.empty?

      ENV['USER'] || ENV['USERNAME']
    }

    set :slack_deploy_object, lambda {
      fetch :branch
    }

    set :slack_deploy_info, lambda {
      `git log -n 1 --pretty=format:'%h "%s" by %an' --date=relative origin/#{fetch :branch}`.strip
    }

    set :slack_deploy_destination, lambda {
      fetch :stage
    }

    set :slack_username, lambda {
      [fetch(:slack_app_name), fetch(:stage).capitalize].compact.join(' ')
    }

    set :slack_app_name, -> { 'Slackistrano' }
  end
end
