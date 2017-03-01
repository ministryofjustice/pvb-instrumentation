module PVB
  module Instrumentation
    module Excon
      class Response
        include Instrument

        def process
          # no-op
        end
      end
    end
  end
end
