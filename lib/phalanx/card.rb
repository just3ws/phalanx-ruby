# frozen_string_literal: true

module Phalanx
  class Card
    attr_reader :pip, :val, :health

    def initialize(pip:, val:)
      @pip = pip
      @health = @val = val
    end

    def defend!(other)
      @health -= other.val
    end

    def alive?
      @health.positive?
    end
  end
end
