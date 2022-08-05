# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'como_client/version'

Gem::Specification.new do |spec|
  spec.name          = "como_client"
  spec.version       = COMOClient::VERSION
  spec.authors       = ["Disler Colin"]
  spec.email         = ["Colin.Disler@gmail.com"]

  spec.summary       = "A Prometheus Client for continuous monitoring"
  spec.description   = "A Prometheus Client for continuous monitoring. Configure & Run."
  spec.homepage      = "https://github.com/lombold/COMO_Client"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against" \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_dependency 'concurrent-ruby', '~> 1.1.5'
  spec.add_dependency 'prometheus-client', '~> 4.0'
  spec.add_dependency 'usagewatch_ext', '~> 0.2.1'
  spec.add_dependency 'mem_info', '~> 1.0.1'
end
