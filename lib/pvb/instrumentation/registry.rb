# frozen_string_literal: true
require 'pvb/instrumentation/instrument'

module PVB
  class Instrumentation
    class Registry
      attr_reader :registry
      @registry = {}

      class << self
        def register(event, klass)
          @registry[event] = klass
          ActiveSupport::Notifications.subscribe(event) do |e, start, finish, _id, payload|
            processor = Registry.for(e, start, finish, payload)
            processor.process
          end
        end

        def for(event, *args)
          @registry[event]&.new(*args)
        end

        def [](event)
          @registry[event]
        end
      end
    end
  end
end
