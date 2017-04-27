# frozen_string_literal: true

require 'spec_helper'

RSpec.describe PVB::Instrumentation::Excon::Response do
  let(:category)   { 'category_name' }

  let(:event_name) { described_class.name }
  let(:nowish)     { Time.now }
  let(:start)      { nowish }
  let(:finish)     { nowish + 0.5001 }
  let(:setup_proc) { proc {|event| } }
  let(:payload)    {
    { method: :get, path: '/some/path', category: category }
  }

  let(:event)      { ActiveSupport::Notifications::Event.new(event_name, start, finish, '_id', payload) }

  subject { described_class.new(event, &setup_proc) }

  it 'calls the setup proc' do
    expect { |b| described_class.new(event, &b) }.to yield_control
  end

  context 'with a previous time recorded' do
    before do |ex|
      PVB::Instrumentation.append_to_log(category => 1500.2)
    end

    it 'appends the response time to the total time' do
      subject.process
      expect(PVB::Instrumentation.custom_log_items).to include(category => 2000.3)
    end
  end
end
