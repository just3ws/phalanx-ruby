# frozen_string_literal: true

require_relative 'suits'
require_relative 'card'

module Phalanx
  class Attack
    attr_reader :attacker, :front, :back, :damage, :front_health, :back_health

    def initialize(attacker:, front:, back:)
      @damage = attacker.value
      @attacker = attacker

      @front_health = front.value
      @front = front

      @back_health = back.value
      @back = back
    end

    def to_s
      "#{attacker}|#{front}:#{back}"
    end

    def attack
      @attack ||=
        begin
          @front_health = front.value - damage

          # Diamond defense bonus
          @front_health += front.value if front.suit == Phalanx::Suits.diamond && back.suit != Phalanx::Suits.null

          @damage -= front.value

          # Heart defense bonus
          @damage -= front.value if front.suit == Phalanx::Suits.heart && back.suit == Phalanx::Suits.null

          @back_health = back.value - damage

          # Club attack bonus
          @back_health -= damage if attacker.suit == Phalanx::Suits.club

          @damage -= back.value

          # Heart defense bonus
          @damage -= back.value if back.suit == Phalanx::Suits.heart

          # Spade attack bonus
          @damage += damage if attacker.suit == Phalanx::Suits.spade

          { to_s => { damage:, front_health:, back_health: } }
        end

      self
    end
  end
end
