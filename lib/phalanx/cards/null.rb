# frozen_string_literal: true

require_relative '../card'

module Phalanx
  module Cards
    class Null < Card
      def initialize(*)
        super(value: 0, suit: Suits.null)
      end
    end
  end
end
