# frozen_string_literal: true

require_relative '../card'

module Phalanx
  module Cards
    class Club < Card
      def initialize(value:, suit: Suits.club)
        @suit = Suits.club
        super(value:, suit:)
      end
    end
  end
end
