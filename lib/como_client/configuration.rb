module COMOClient
    class Configuration
      attr_accessor  :enabled
      attr_accessor  :push_interval
      attr_accessor  :pushgateway_url
      attr_accessor  :job_name
      attr_accessor  :instance_name

      def initialize
        @enabled = false
        @push_interval = 20
        @pushgateway_url = "https://example.com"
        @job_name = "prometheus-metrics"
        @instance_name = "prometheus-metrics#0"
      end

    end
end