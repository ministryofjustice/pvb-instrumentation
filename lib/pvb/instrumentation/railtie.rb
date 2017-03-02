# frozen_string_literal: true
require 'pvb/instrumentation/application_controller_helpers'

module PVB
  class Intrumentation
    class Railtie < Rails::Railtie
      ActiveSupport.on_load :action_controller do
        include ApplicationControllerHelpers
      end
    end
  end
end
