# frozen_string_literal: true
module PVB # :nodoc:
  class Instrumentation # :nodoc:
    module Faraday # :nodoc:
      class Request # :nodoc:
        include Instrument

        def process
          Instrumentation.append_to_log(
            sentry: { status: status, request_time: time_in_ms }
          )
        end

        private

        def time_in_ms
          (finish - start) * 1000
        end

        def status
          payload.status
        end
      end
    end
  end
end
