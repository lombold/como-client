require "spec_helper"
require 'como_client/configuration'

module COMOClient
  describe Configuration do
    describe "#enabled" do
      it "default value is false" do
        Configuration.new.enabled = false
      end
    end

    describe "#enabled=" do
      it "can set value" do
        config = Configuration.new
        config.enabled = true
        expect(config.enabled).to eq(true)
      end
    end

    describe "#push_interval" do
      it "default value is 20 seconds" do
        Configuration.new.push_interval = 20
      end
    end

    describe "#push_interval=" do
      it "can set value" do
        config = Configuration.new
        config.push_interval = 10
        expect(config.push_interval).to eq(10)
      end
    end

    describe "#pushgateway_url=" do
      it "can set value" do
        config = Configuration.new
        config.pushgateway_url = "https://example.com"
        expect(config.pushgateway_url).to eq("https://example.com")
      end
    end

    describe "#job_name" do
      it "default value is 20 seconds" do
        Configuration.new.job_name = "prometheus-metrics"
      end
    end

    describe "#job_name=" do
      it "can set value" do
        config = Configuration.new
        config.job_name = "prometheus-metrics-2"
        expect(config.job_name).to eq("prometheus-metrics-2")
      end
    end

    describe "#instance_name" do
      it "default value is 20 seconds" do
        Configuration.new.instance_name = "prometheus-metrics#0"
      end
    end

    describe "#instance_name=" do
      it "can set value" do
        config = Configuration.new
        config.instance_name = "prometheus-metrics#1"
        expect(config.instance_name).to eq("prometheus-metrics#1")
      end
    end
  end
end