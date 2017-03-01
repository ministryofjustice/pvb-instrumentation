module PVB
  class Instrumentation
    module Instrument
      def initialize(start, finish, payload)
        self.start   = start
        self.finish  = finish
        self.payload = payload
      end

      private

      attr_accessor :start, :finish, :payload

      def api_call_error
        "#{RequestStore.store[:nomis_api_name]}_error"
      end

      def logger
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
rescue LoadError
end

begin
  require 'faraday'
  require 'pvb/instrumentation/faraday/request'
rescue LoadError
end
