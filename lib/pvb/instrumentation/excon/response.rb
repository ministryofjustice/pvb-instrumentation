# frozen_string_literal: true
module PVB # :nodoc:
  class Instrumentation # :nodoc:
    module Excon # :nodoc:
      class Response # :nodoc:
        include Instrument

        def process
          # no-op
        end
      end
    end
  end
end
