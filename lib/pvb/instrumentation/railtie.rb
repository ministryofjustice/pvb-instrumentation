# frozen_string_literal: true
require 'pvb/instrumentation/application_controller_helpers'

module PVB # :nodoc:
  class Intrumentation # :nodoc:
    class Railtie < Rails::Railtie # :nodoc:
      ActiveSupport.on_load :action_controller do
        include ApplicationControllerHelpers
      end
    end
  end
end
