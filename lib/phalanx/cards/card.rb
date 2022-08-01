# frozen_string_literal: true

require_relative '../suits'

module Phalanx
  module Cards
    class Card
      include Comparable

      attr_reader :suit, :value

      def initialize(suit:, value:)
        @suit = suit
        @value = value
      end

      def inspect
        to_s
      end

      def to_s
        to_a.join
      end

      def to_a
        [value, suit]
      end

      def <=>(other)
        to_a <=> other.to_a
      end
    end
  end
end
