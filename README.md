# COMOClient

If you work in a Cloud Foundry environment and want to actively push your Prometheus Metrics in a certain interval, you definitely have to try the **COMO Client** Gem!


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'como_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install como_client

## Usage

```
# config/initializers/como_client.rb

COMOClient.configure do |config|
  config.enabled = true
  config.push_interval = 10
  config.pushgateway_url = "https://your-app.some-prometheus-pushgateway.com"
  config.job_name = "your-app-metrics"
  config.instance_name = "your-app-metrics-1"
end
```
