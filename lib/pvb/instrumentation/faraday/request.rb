# frozen_string_literal: true
module PVB # :nodoc:
  class Instrumentation # :nodoc:
    module Faraday # :nodoc:
      class Request # :nodoc:
        include Instrument

        def process
          Instrumentation.append_to_log(
            sentry: { status: status, request_time: event.duration }
          )
        end

        private

        def status
          event.payload.status
        end
      end
    end
  end
end
