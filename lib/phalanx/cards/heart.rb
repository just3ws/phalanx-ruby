# frozen_string_literal: true

require_relative '../card'

module Phalanx
  module Cards
    class Heart < Card
      def initialize(value:, suit: Suits.heart)
        @suit = Suits.heart
        super(value:, suit:)
      end
    end
  end
end
