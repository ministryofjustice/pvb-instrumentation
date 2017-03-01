require "spec_helper"
require 'pvb/instrumentation/instrument_factory'

RSpec.describe PVB::Instrumentation::InstrumentFactory do
  let(:start)  { double(Time) }
  let(:finish) { double(Time) }
  let(:payload)  { double(Hash) }

  describe '.for' do
    describe "with 'nomis_api.request" do
      let(:instrumentation) { 'nomis_api.request' }

      it 'returns an instrumentation request' do
        expect(described_class.for(instrumentation, start, finish, payload)).to be_instance_of(PVB::Instrumentation::Excon::Request)
      end
    end

    describe "with 'nomis_api.retry" do
      let(:instrumentation) { 'nomis_api.retry' }

      it 'returns an instrumentation retry' do
        expect(described_class.for(instrumentation, start, finish, payload)).to be_instance_of(PVB::Instrumentation::Excon::Retry)
      end
    end

    describe "with 'nomis_api.response" do
      let(:instrumentation) { 'nomis_api.response' }

      it 'returns an instrumentation response' do
        expect(described_class.for(instrumentation, start, finish, payload)).to be_instance_of(PVB::Instrumentation::Excon::Response)
      end
    end

    describe "with 'nomis_api.error" do
      let(:instrumentation) { 'nomis_api.error' }

      it 'returns an instrumentation error' do
        expect(described_class.for(instrumentation, start, finish, payload)).to be_instance_of(PVB::Instrumentation::Excon::Error)
      end
    end

    describe "with 'request.faraday" do
      let(:instrumentation) { 'request.faraday' }

      it 'returns an instrumentation error' do
        expect(described_class.for(instrumentation, start, finish, payload)).to be_instance_of(PVB::Instrumentation::Faraday::Request)
      end
    end
  end
end
