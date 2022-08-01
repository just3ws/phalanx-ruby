# frozen_string_literal: true

require_relative 'card'

module Phalanx
  module Cards
    class Club < Card
      def initialize(value:)
        super(value:, suit: Suits.club)
      end
    end
  end
end
