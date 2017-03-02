require 'pvb/instrumentation/version'
require 'pvb/instrumentation/instrument'
require 'active_support'
require 'request_store'

module PVB

  class Configuration
    attr_accessor :logger

    def logger
      @logger ||= Logger.new(STDOUT)
    end

  end

  class Instrumentation
    class << self

      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration) if block_given?
      end

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

      def logger
        configuration.logger
      end
    end
  end
end

require 'pvb/instrumentation/railtie' if defined?(Rails)
