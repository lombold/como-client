module COMOClient
  module Metrics
    def self.register
      COMOClient.logger.debug("register metrics...")

      #Register Cloud Froundry metrics if the app is pushed to Cloud Foundry
      COMOClient::Metrics::CF.register if !ENV["CF_INSTANCE_GUID"].nil?

      COMOClient.logger.debug("registered metrics")
    end

    def self.update
      COMOClient.logger.debug("update metrics...")

      #Update Cloud Froundry metrics if the app is pushed to Cloud Foundry
      COMOClient::Metrics::CF.update if !ENV["CF_INSTANCE_GUID"].nil?

      COMOClient.logger.debug("updated metrics")
    end
  end
end