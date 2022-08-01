# frozen_string_literal: true

require_relative 'card'

module Phalanx
  module Cards
    class Spade < Card
      def initialize(value:)
        super(value:, suit: Suits.spade)
      end
    end
  end
end
