module PVB
  class Intrumentation
    module ApplicationControllerHelpers

      def append_to_log(request_params)
        Instrumentation.append_to_log(request_params)
      end

      # WARNING: This a Rails private method, could easily break in the future.
      #
      # Looks rather strange, but this is the suggested mechanism to add extra data
      # into the event passed to lograge's custom options. The method is part of
      # Rails' instrumentation code, and is run after each request.
      def append_info_to_payload(payload)
        super
        payload[:custom_log_items] = Instrumentation.custom_log_items
      end
    end
  end
end
