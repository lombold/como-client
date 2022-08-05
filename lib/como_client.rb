require 'como_client/version'
require 'como_client/configuration'
require 'como_client/tasks/periodic_push'
require 'como_client/tasks/observer'
require 'como_client/metrics'
require 'como_client/metrics/cf'
require 'concurrent'
require 'rack'
require 'prometheus/middleware/exporter'
require 'prometheus/middleware/collector'

module COMOClient
  def self.logger
    @@logger ||= defined?(Rails) ? Rails.logger : Logger.new(STDOUT)
  end

  def self.logger=(logger)
    @@logger = logger
  end

  class Railtie < Rails::Railtie
    initializer 'como_client.configure_rails_initialization' do
      Rails.configuration.middleware.use Prometheus::Middleware::Collector
    end
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
    self.run
  end

  def self.run

    COMOClient.logger.debug("initialise metrics push service...")
    if @pushTask and @pushTask.running?
      COMOClient.logger.debug("push service is already running!")
      return true
    end

    COMOClient::Metrics.register
    @pushTask = Concurrent::TimerTask.new(execution_interval: @configuration.push_interval, timeout_interval: 20){COMOClient::Tasks::PeriodicPush.push}
    @pushTask.add_observer(COMOClient::Tasks::Observer.new)
    @pushTask.execute
    COMOClient.logger.info("push service initialised")
    @pushTask.running?
  end

  def self.stop
    @pushTask.shutdown
  end
end
