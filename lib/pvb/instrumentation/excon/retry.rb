# frozen_string_literal: true
module PVB # :nodoc:
  class Instrumentation # :nodoc:
    module Excon # :nodoc:
      class Retry < Request # :nodoc:
        def process
          PVB::Instrumentation.incr(:api_retry_count)
          PVB::Instrumentation.append_to_log(category => total_time)
          logger.info format("#{message} - %.2fms", event.duration)
        end
      end
    end
  end
end
