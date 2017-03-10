# frozen_string_literal: true
require 'pvb/instrumentation/instrument'

module PVB # :nodoc:
  class Instrumentation # :nodoc:
    class Registry # :nodoc:
      attr_reader :registry
      @registry = {}

      class << self
        def register(event_name, klass, setup_proc)
          @registry[event_name] = [klass, setup_proc]

          ActiveSupport::Notifications
            .subscribe(event_name) do |e, start, finish, id, payload|

            event = ActiveSupport::Notifications::Event.new(
              e, start, finish, id, payload
            )
            Registry.for(event).process
          end
        end

        def for(event)
          klass, setup_proc = @registry[event.name]
          klass&.new(event, &setup_proc)
        end

        def [](event)
          @registry[event]
        end
      end
    end
  end
end
