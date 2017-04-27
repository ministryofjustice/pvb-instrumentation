# frozen_string_literal: true
module PVB # :nodoc:
  class Instrumentation # :nodoc:
    module Excon # :nodoc:
      class Request # :nodoc:
        include Instrument

        def process
          store_api_name
          instrument_request
          logger.info format("#{message} - %.2fms", event.duration)
        end

        private

        def category
          event.payload[:category] || event.name
        end

        def message
          "Calling NOMIS API: #{request_method} #{request_path}"
        end

        def total_time
          current_time = PVB::Instrumentation.custom_log_items.fetch(category, 0)
          current_time + event.duration
        end

        def instrument_request
          # Set to false initialially, error instrumenter reverses this
          PVB::Instrumentation.append_to_log(api_call_error => false)
          PVB::Instrumentation.incr(:api_request_count)
          PVB::Instrumentation.append_to_log(category => total_time)
        end

        def store_api_name
          RequestStore[:api_call_id] = request_path.split('/').last
        end

        def request_method
          event.payload[:method].to_s.upcase
        end

        def request_path
          event.payload[:path]
        end
      end
    end
  end
end
