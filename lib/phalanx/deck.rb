# frozen_string_literal: true

module Phalanx
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
end
