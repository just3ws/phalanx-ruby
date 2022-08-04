# frozen_string_literal: true

require_relative '../card'

module Phalanx
  module Cards
    class Diamond < Card
      def initialize(value:, suit: Suits.diamond)
        @suit = Suits.diamond
        super(value:, suit:)
      end
    end
  end
end
