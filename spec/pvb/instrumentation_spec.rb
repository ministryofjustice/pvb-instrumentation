require "spec_helper"

RSpec.describe PVB::Instrumentation do
  it "has a version number" do
    expect(PVB::Instrumentation::VERSION).not_to be nil
  end

  describe '#configure' do
    let(:logger) { double('logger') }

    describe '#logger' do
      it 'allows to configure the logger' do
        expect do
          PVB::Instrumentation.configure do |config|
            config.logger = logger
          end
        end.to change { PVB::Instrumentation.logger }.from(instance_of(Logger)).to(logger)
      end
    end

  end
end
