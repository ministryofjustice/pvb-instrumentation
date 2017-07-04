[![Build Status](https://travis-ci.org/ministryofjustice/pvb-instrumentation.svg?branch=master)](https://travis-ci.org/ministryofjustice/pvb-instrumentation)
[![Code Climate](https://codeclimate.com/github/ministryofjustice/pvb-instrumentation/badges/gpa.svg)](https://codeclimate.com/github/ministryofjustice/pvb-instrumentation)
# Pvb::Instrumentation

Adds instrumentation to any Rail app. Includes default event processor classes 
for Excon and Faraday.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pvb-instrumentation'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pvb-instrumentation

## Usage

Create a Rails initialiser similar to:

```ruby
require 'pvb/instrumentation'

PVB::Instrumentation.configure do |config|

  config.logger = Rails.logger

  # Example using included Excon event processor classes 
  config.register('my.excon.error.event',     PVB::Instrumentation::Excon::Error)
  config.register('my.excon.request.event',   PVB::Instrumentation::Excon::Request)
  config.register('my.excon.response.event',  PVB::Instrumentation::Excon::Response)
  config.register('my.excon.retry.event',     PVB::Instrumentation::Excon::Retry)

  # Example using included Faraday event classes
  config.register('my.faraday.request.event', PVB::Instrumentation::Faraday::Request)

  # Example using your own event class
  config.register('my.self.defined.event',    My::Self::Defined::EventProcessor)

  # Add more config.register calls as needed...

end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

This gem uses [Appraisal](https://github.com/thoughtbot/appraisal) to test against different versions of Activesupport. Do do this run: 

```
bundle exec appraisal rake
```

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ministryofjustice/pvb-instrumentation.
