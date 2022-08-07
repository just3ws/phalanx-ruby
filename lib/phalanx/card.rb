# frozen_string_literal: true

require_relative 'suits'

module Phalanx
  class Card
    include Comparable

    attr_reader :suit, :value

    def initialize(suit:, value:)
      @suit = suit
      @value = value
      @value = suit == Suits.null ? 0 : value
    end

    def self.parse(str)
      suit, value = str.partition(/\d+/).reject(&:empty?)

      card_klass = Suits::TYPE_LOOKUP[suit]
      value = Integer(value)

      card_klass.new(value:)
    end

    def inspect
      to_s
    end

    def to_s
      [suit, value.to_s.rjust(2, '0')].join
    end

    def to_a
      [value, suit]
    end

    def <=>(other)
      to_a <=> other.to_a
    end
  end
end
