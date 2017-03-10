# frozen_string_literal: true
RSpec.shared_context 'pvb instrumentation' do

  let(:category)   { 'category_name' }

  let(:event_name) { described_class.name }
  let(:nowish)     { Time.now }
  let(:start)      { nowish }
  let(:finish)     { nowish + 0.5 }
  let(:setup_proc) { proc {|event| puts event } }
  let(:payload)    {
    { method: :get, path: '/some/path', category: category }
  }

  let(:event)      { ActiveSupport::Notifications::Event.new(event_name, start, finish, '_id', payload) }

  subject { described_class.new(event, &setup_proc) }
end

RSpec.shared_examples_for 'request time logger' do
  it 'appends request time to the total request time' do
    subject.process
    expect(PVB::Instrumentation.custom_log_items).to include(category => 500)
  end

  it 'logs the current request time' do
    expect(PVB::Instrumentation.logger)
      .to receive(:info).with('Calling NOMIS API: GET /some/path - 500.00ms')
    subject.process
  end

  it 'calls the setup proc' do
    expect { |b| described_class.new(event, &b) }.to yield_control
  end

end
