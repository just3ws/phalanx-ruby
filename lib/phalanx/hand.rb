# frozen_string_literal: true

module Phalanx
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
end
