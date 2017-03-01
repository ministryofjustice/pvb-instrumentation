require "spec_helper"

RSpec.describe PVB::Instrumentation::Excon::Error do
  let(:nowish)           { Time.now }
  let(:start)            { nowish }
  let(:finish)           { nowish + 0.5 }
  let(:payload)          { { method: :get, path: '/some/path' } }

  subject { described_class.new(start, finish, payload) }

  describe '#process' do
    it 'increments the api_error_count' do
      expect(PVB::Instrumentation).to receive(:incr).with(:api_error_count)
      subject.process
    end
  end
end
