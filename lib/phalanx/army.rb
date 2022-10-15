# frozen_string_literal: true

module Phalanx
  class Army
    attr_reader :cards

    def initialize(cards: [])
      @cards = cards
    end

    def <<(new_cards)
      cards.append(*new_cards)
    end

    def empty?
      cards.empty?
    end
  end
end
