# frozen_string_literal: true

module Phalanx
  module Values
    def self.ace
      1
    end

    def self.joker
      0
    end

    def self.numbered_cards
      (2..9)
    end

    def self.face_cards
      (10..12)
    end
  end
end
