require 'sidekiq'
require 'tilt/erb'

require_relative 'sidekiq-scheduler/version'
require_relative 'sidekiq-scheduler/manager'

Sidekiq.configure_server do |config|
  config.on(:shutdown) do
    config.options[:schedule_manager].stop
  end
end
