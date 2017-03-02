# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pvb/instrumentation/version'

Gem::Specification.new do |spec|
  spec.name          = 'pvb-instrumentation'
  spec.version       = PVB::Instrumentation::VERSION
  spec.authors       = ['Yann Marquet']
  spec.email         = ['yann.marquet@digital.justice.gov.uk']

  spec.summary       = 'Provide instrumentation for HTTP Clients used in prison visit booking applications'
  spec.description   = 'Provide instrumentation for HTTP Clients (Excon and Faraday) used in prison visit booking applications'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 4.2'
  spec.add_dependency 'request_store', '~> 1.3.2'
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'excon', '~> 0.55'
  spec.add_development_dependency 'faraday', '~> 0.10.1'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'rubocop'
end
