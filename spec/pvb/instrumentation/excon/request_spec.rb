require "spec_helper"

RSpec.describe PVB::Instrumentation::Excon::Request do
  include_context 'pvb instrumentation'

  describe '#process' do
    it 'increments the api_request_count' do
      expect(PVB::Instrumentation).to receive(:incr).with(:api_request_count)
      subject.process
    end

    it_behaves_like 'request time logger'
  end
end
