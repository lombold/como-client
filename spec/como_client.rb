require 'spec_helper'
require 'como_client'

describe COMOClient do
  before do
    COMOClient.configure do |config|
      config.enabled                = true
      config.push_interval          = 10
      config.pushgateway_url        = "https://example.com"
      config.job_name               = "test-job"
      config.instance_name          = "test-job#1"
    end
  end

  after do
    COMOClient.reset
  end

  # describe '.run' do
  #   it 'starts the service' do
  #     expect(output).to eq true
  #   end
  # end
  #
  # describe '.stop' do
  #   it 'stops the service' do
  #     expect(output).to eq true
  #   end
  # end

  describe '#configure' do
    before do
      COMOClient.configure do |config|
        config.enabled                = true
        config.push_interval          = 10
        config.pushgateway_url        = "https://example.com"
        config.job_name               = "test-job"
        config.instance_name          = "test-job#1"
      end
    end
  end

  describe ".reset" do
    before :each do
      COMOClient.configure do |config|
        config.enabled                = true
        config.push_interval          = 10
        config.pushgateway_url        = "https://example.com"
        config.job_name               = "test-job"
        config.instance_name          = "test-job#1"
      end
    end

    it "resets the configuration" do
      COMOClient.reset

      config = COMOClient.configuration

      expect(config.enabled).to eq(false)
      expect(config.push_interval).to eq(20)
      expect(config.pushgateway_url).to eq("https://example.com")
      expect(config.job_name).to eq("prometheus-metrics")
      expect(config.instance_name).to eq("prometheus-metrics#0")
    end
  end

end
