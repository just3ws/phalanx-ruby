# frozen_string_literal: true

require 'faker'

RSpec.describe Phalanx::Game do
  subject(:game) { described_class.new(player1:, player2:) }

  let(:player1) {
    Phalanx::Player.new(deck: Phalanx::Deck.new, hand: Phalanx::Hand.new,
                        name: Faker::TvShows::GameOfThrones.character)
  }

  let(:player2) {
    Phalanx::Player.new(deck: Phalanx::Deck.new, hand: Phalanx::Hand.new,
                        name: Faker::TvShows::GameOfThrones.character)
  }

  it 'play a game' do
    expect(game.player1).to eq(player1)
    expect(game.player2).to eq(player2)

    expect(game.player1.hand.count).to eq(12)
    expect(game.player2.hand.count).to eq(12)
  end
end
