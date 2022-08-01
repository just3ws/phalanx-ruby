# frozen_string_literal: true

require_relative 'card'

module Phalanx
  module Cards
    class Diamond < Card
      def initialize(value:)
        super(value:, suit: Suits.diamond)
      end
    end
  end
end
