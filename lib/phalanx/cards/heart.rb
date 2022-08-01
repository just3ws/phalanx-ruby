# frozen_string_literal: true

require_relative 'card'

module Phalanx
  module Cards
    class Heart < Card
      def initialize(value:)
        super(value:, suit: Suits.heart)
      end
    end
  end
end
