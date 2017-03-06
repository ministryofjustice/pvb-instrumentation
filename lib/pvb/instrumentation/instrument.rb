# frozen_string_literal: true
module PVB # :nodoc:
  class Instrumentation # :nodoc:
    module Instrument # :nodoc:

      def initialize(event)
        self.event = event
      end

      private

      attr_accessor :event

      def api_call_error
        "#{RequestStore.store[:api_call_id]}_error"
      end

      def logger
        Instrumentation.logger
      end
    end
  end
end

begin
  require 'excon'
  require 'pvb/instrumentation/excon/request'
  require 'pvb/instrumentation/excon/retry'
  require 'pvb/instrumentation/excon/response'
  require 'pvb/instrumentation/excon/error'
rescue LoadError => e
  STDERR.puts e.message
end

begin
  require 'faraday'
  require 'pvb/instrumentation/faraday/request'
rescue LoadError => e
  STDERR.puts e.message
end
