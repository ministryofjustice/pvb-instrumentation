module PVB
  class Instrumentation
    module Excon
      class Retry < Request
        def process
          PVB::Instrumentation.incr(:api_retry_count)
          PVB::Instrumentation.append_to_log(category => total_time)
          logger.info "#{message} - %.2fms" % [time_in_ms]
        end
      end
    end
  end
end
