# frozen_string_literal: true

module Phalanx
  class Player
    attr_reader :deck, :hand, :health, :name, :discard_pile, :graveyard_pile, :army

    def initialize(deck:, hand:, name:, health: 20)
      @name = name
      @deck = deck
      @hand = hand
      @health = health
      @discard_pile = []
      @graveyard_pile = []
      @army = Army.new
    end

    def deploy!
      # army << draw!(8)
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
end
