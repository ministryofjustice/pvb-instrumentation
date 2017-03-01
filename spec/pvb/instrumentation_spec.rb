require "spec_helper"

RSpec.describe PVB::Instrumentation do
  it "has a version number" do
    expect(PVB::Instrumentation::VERSION).not_to be nil
  end
end
