# frozen_string_literal: true
module PVB
  class Instrumentation
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
