# frozen_string_literal: true

require 'faker'

module Phalanx
  class Card
    attr_reader :pip, :val, :health

    def initialize(pip:, val:)
      @pip = pip
      @health = @val = val
    end

    def defend!(other)
      @health -= other.val
    end

    def alive?
      @health.positive?
    end
  end

  class Deck
    attr_reader :cards, :pips, :vals

    def initialize(pips: %i[spade club heart diamond], vals: (2..9))
      @pips = pips.freeze
      @vals = vals.to_a.freeze

      @cards = pips.flat_map { |pip| vals.flat_map { |val| Card.new(pip:, val:) } }.shuffle
    end

    def draw!(count)
      cards.shift(count)
    end

    def count
      cards.count
    end
  end

  class Hand
    attr_reader :cards

    def initialize(cards: [])
      @cards = cards
    end

    def empty?
      cards.empty?
    end

    def count
      cards.count
    end

    def <<(new_cards)
      cards.append(*new_cards)
    end
  end

  class Player
    attr_reader :deck, :hand, :health, :name

    def initialize(deck:, hand:, name:, health: 20)
      @name = name
      @deck = deck
      @hand = hand
      @health = health
    end

    def draw!(count)
      hand << deck.draw!(count)
    end

    def count
      cards.count
    end

    def defend!(dmg)
      @health -= dmg
    end

    def alive?
      health.positive?
    end
  end

  class Game
    attr_reader :player1, :player2

    def initialize(player1:, player2:)
      @player1 = player1
      @player2 = player2
    end
  end
end

RSpec.describe Phalanx do
  describe Phalanx::Game do
    subject(:game) { described_class.new(player1:, player2:) }

    let(:player1) {
      Phalanx::Player.new(deck: Phalanx::Deck.new, hand: Phalanx::Hand.new,
                          name: Faker::TvShows::GameOfThrones.character)
    }
    let(:player2) {
      Phalanx::Player.new(deck: Phalanx::Deck.new, hand: Phalanx::Hand.new,
                          name: Faker::TvShows::GameOfThrones.character)
    }

    it do
      expect(game.player1).to eq(player1)
      expect(game.player2).to eq(player2)
    end
  end

  describe Phalanx::Player do
    subject(:player) { described_class.new(deck:, hand:, name:) }

    let(:name) { Faker::TvShows::GameOfThrones.character }
    let(:deck) { Phalanx::Deck.new }
    let(:hand) { Phalanx::Hand.new }

    it { expect(player.name).to eq(name) }
    it { expect(player.health).to eq(20) }
    it { expect(player.deck.count).to eq(32) }
    it { expect(player.hand.count).to be_zero }
    it { expect(player).to be_alive }

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

  describe Phalanx::Hand do
    subject(:hand) { described_class.new }

    it { expect(hand).to be_empty }
    it { expect(hand.count).to be_zero }
  end

  describe Phalanx::Deck do
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

  describe Phalanx::Card do
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

  it { expect(Phalanx::VERSION).to eq('0.1.0') }
end
