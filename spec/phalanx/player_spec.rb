# frozen_string_literal: true

RSpec.describe Phalanx::Player do
  subject(:player) { described_class.new(deck:, hand:, name:) }

  let(:name) { Faker::TvShows::GameOfThrones.character }
  let(:deck) { Phalanx::Deck.new }
  let(:hand) { Phalanx::Hand.new }

  it { expect(player.name).to eq(name) }
  it { expect(player.health).to eq(20) }
  it { expect(player.deck.count).to eq(32) }
  it { expect(player.hand.count).to be_zero }
  it { expect(player).to be_alive }
  it { expect(player.discard_pile).to be_empty }
  it { expect(player.graveyard_pile).to be_empty }
  it { expect(player.army).to be_empty }

  it do
    player.draw!(4)

    expect(player.deck.count).to eq(28)
    expect(player.hand.count).to eq(4)
  end

  it { expect { player.defend!(3) }.to change(player, :health).from(20).to(17) }

  it do
    player.defend!(18)

    expect(player.health).to eq(2)
    expect(player).to be_alive

    player.defend!(2)

    expect(player.health).to be_zero
    expect(player).not_to be_alive
  end
end
