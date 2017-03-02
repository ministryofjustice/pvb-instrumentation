# frozen_string_literal: true
module PVB # :nodoc:
  class Instrumentation # :nodoc:
    module Excon # :nodoc:
      class Error # :nodoc:
        include Instrument

        def process
          Instrumentation.append_to_log(api_call_error => true)
          Instrumentation.incr(:api_error_count)
        end
      end
    end
  end
end
