module COMOClient
  module Metrics
    class CF

      require 'usagewatch_ext'
      require 'mem_info'

      def self.register
        COMOClient.logger.debug("register CF metrics...")

        prometheus =  Prometheus::Client.registry

        hardwareGauges = Prometheus::Client::Gauge.new( :instance_metrics, docstring: 'instance hardware metrics', labels: [:hardware])
        prometheus.register(hardwareGauges)
        COMOClient.logger.debug("registered hardware gauges")

        COMOClient.logger.debug("registered CF metrics")
      end
      def self.update
        COMOClient.logger.debug("update CF metrics...")
        prometheus =  Prometheus::Client.registry

        usw = Usagewatch
        mem = MemInfo.new
        hardwareGauges = prometheus.get(:instance_metrics)
        hardwareGauges.set(usw.uw_cpuused, labels: { hardware: 'cpu'})
        hardwareGauges.set(usw.uw_load, labels: { hardware: 'avg_load_past_minute'})
        hardwareGauges.set(mem.memtotal, labels: { hardware: 'memory_total'})
        hardwareGauges.set(mem.memfree, labels: { hardware: 'memory_free'})
        hardwareGauges.set(mem.memused, labels: { hardware: 'memory_used'})
        hardwareGauges.set(usw.uw_diskused_perc, labels: { hardware: 'disk_used_perc'})
        hardwareGauges.set(usw.uw_diskused, labels: { hardware: 'disk_used_gigabytes'})
        hardwareGauges.set(IO.read('/proc/uptime').split[0].to_i, labels: { hardware: 'uptime_seconds'})

        COMOClient.logger.debug("updated CF metrics")
      end
    end
  end
end