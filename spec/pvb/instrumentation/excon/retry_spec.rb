require "spec_helper"

RSpec.describe PVB::Instrumentation::Excon::Retry do
  include_context 'pvb instrumentation'
  it_behaves_like 'request time logger'

  it 'increments the api_retry_count' do
    expect(PVB::Instrumentation).to receive(:incr).with(:api_retry_count)
    subject.process
  end
end
