# frozen_string_literal: true

module Phalanx
  class Attack
    attr_reader :attacker, :front, :back

    def initialize(attacker, front, back)
      @attacker = attacker
      @front = front
      @back = back
    end

    def resolve
      damage = attacker.value

      if front.is_a?(Cards::Null) && back.is_a?(Cards::Null)
        damage *= 2 if attacker.is_a?(Cards::Spade)

        return damage
      end

      if back.is_a?(Cards::Null)

      end

      defense = []

      damage = attacker.value

      damage = attacker.value - front.value

      defense.push(damage)

      if attacker.suit == Suits.club

      else
        back.value
      end

      ap defense

      damage
    end
  end
end
