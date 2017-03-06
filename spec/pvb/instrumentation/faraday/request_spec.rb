# frozen_string_literal: true
require 'spec_helper'

RSpec.describe PVB::Instrumentation::Faraday::Request do

  include_context 'pvb instrumentation' do
    let(:payload) do
      Faraday::Env.new nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 200
    end
  end

  describe 'do stuff' do

    it 'logs the resquest time and status' do
      subject.process
      expect(PVB::Instrumentation.custom_log_items).to include(
        sentry: { status: 200, request_time: 500 }
      )
    end
  end
end
