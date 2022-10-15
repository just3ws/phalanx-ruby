# frozen_string_literal: true

RSpec.describe Phalanx::Card do
  subject(:card) { described_class.new(pip: :spade, val: 3) }

  let(:other) { described_class.new(pip: :heart, val: 2) }

  it { expect(card.pip).to eq(:spade) }
  it { expect(card.val).to eq(3) }
  it { expect(card.health).to eq(card.val) }

  it do
    expect { card.defend!(other) }.to change(card, :health).from(3).to(1)
    expect(card).to be_alive

    expect { card.defend!(other) }.to change(card, :health).from(1).to(-1)
    expect(card).not_to be_alive
  end
end
