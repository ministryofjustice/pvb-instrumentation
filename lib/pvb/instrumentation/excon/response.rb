# frozen_string_literal: true
module PVB # :nodoc:
  class Instrumentation # :nodoc:
    module Excon # :nodoc:
      class Response # :nodoc:
        include Instrument

        def process
          instrument_response
        end

        private

        def category
          event.payload[:category] || event.name
        end

        def total_time
          PVB::Instrumentation.custom_log_items[category] + event.duration
        end

        def instrument_response
          PVB::Instrumentation.append_to_log(category => total_time)
        end
      end
    end
  end
end
