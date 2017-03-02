require 'spec_helper'
require 'pvb/instrumentation/registry'

RSpec.describe PVB::Instrumentation::Registry do
  let(:start)   { double(Time) }
  let(:finish)  { double(Time) }
  let(:payload) { double(Hash) }
  let(:event) { 'nomis_api.request' }

  describe '.register' do
    it 'subscribe to active support notifications' do
      expect(ActiveSupport::Notifications).to receive(:subscribe).with(event)
      PVB::Instrumentation::Registry.register(event, PVB::Instrumentation::Excon::Request)
    end
  end

  describe '.for' do
    describe "with 'nomis_api.request" do
      it 'returns an instrumentation request' do
        PVB::Instrumentation::Registry.register(event, PVB::Instrumentation::Excon::Request)
        expect(described_class.for(event, start, finish, payload)).to be_instance_of(PVB::Instrumentation::Excon::Request)
      end
    end
  end
end
