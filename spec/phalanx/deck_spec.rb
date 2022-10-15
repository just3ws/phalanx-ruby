# frozen_string_literal: true

RSpec.describe Phalanx::Deck do
  subject(:deck) { described_class.new }

  it { expect(deck.pips).to include(:spade, :heart, :diamond, :club) }

  it { expect(deck.vals).to include(2, 3, 4, 5, 6, 7, 8, 9) }
  it { expect(deck.vals).not_to include(1, 10) }

  it { expect(deck.count).to eq(32) }

  it do
    cards = deck.draw!(4)

    expect(cards.count).to eq(4)
    expect(deck.count).to eq(28)
  end
end
