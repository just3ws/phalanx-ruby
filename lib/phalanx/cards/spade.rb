# frozen_string_literal: true

require_relative '../card'

module Phalanx
  module Cards
    class Spade < Card
      def initialize(value:, suit: Suits.spade)
        @suit = Suits.spade
        super(value:, suit:)
      end
    end
  end
end
