# frozen_string_literal: true
require 'spec_helper'

RSpec.describe PVB::Instrumentation::Excon::Error do
  include_context 'pvb instrumentation'
  describe '#process' do
    it 'increments the api_error_count' do
      expect(PVB::Instrumentation).to receive(:incr).with(:api_error_count)
      subject.process
    end
  end
end
