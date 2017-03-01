require 'pvb/instrumentation/version'
require 'pvb/instrumentation/instrument'
require 'request_store'
module PVB
  module Instrumentation
    class << self
      def append_to_log(payload)
        RequestStore.store[:custom_log_items] ||= {}
        RequestStore.store[:custom_log_items].merge!(payload)
      end

      def custom_log_items
        RequestStore.store[:custom_log_items] || {}
      end

      def incr(counter)
        old_value = custom_log_items[counter] || 0
        append_to_log(counter => old_value + 1)
      end
    end
  end
end
