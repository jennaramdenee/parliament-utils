require 'spec_helper'

RSpec.describe Parliament::Utils do
  include Parliament::Utils

  it "is a module" do
    expect(Parliament::Utils).to be_a(Module)
  end

  it "has a version number" do
    expect(Parliament::Utils::VERSION).not_to be nil
  end
end
