# frozen_string_literal: true

RSpec.describe Phalanx::Hand do
  subject(:hand) { described_class.new }

  it { expect(hand).to be_empty }
  it { expect(hand.count).to be_zero }
end
