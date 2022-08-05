module COMOClient
  module Tasks
    class PeriodicPush
      require 'prometheus/client'
      require 'prometheus/client/push'
      def self.push
        # register some metrics
        COMOClient.logger.debug("pushing metrics to #{COMOClient.configuration.pushgateway_url}")
        COMOClient.logger.debug("job: #{COMOClient.configuration.job_name}")
        COMOClient.logger.debug("instance: #{COMOClient.configuration.instance_name}")
        COMOClient::Metrics.update
        Prometheus::Client::Push.new(job: COMOClient.configuration.job_name, #job name
                                     instance: COMOClient.configuration.instance_name,#instance name
                                     gateway: COMOClient.configuration.pushgateway_url)#pushgateway url
                                .add(Prometheus::Client.registry)
        COMOClient.logger.debug("successfully pushed metrics")
      end
    end
  end
end
