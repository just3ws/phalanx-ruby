#!/usr/bin/env ruby
# frozen_string_literal: true

require 'amazing_print'
require_relative '../lib/phalanx/suits'
require_relative '../lib/phalanx/card'

class Battle
  attr_accessor :attack, :front_health, :back_health
  attr_reader :attacker, :front, :back

  def initialize(attacker:, front:, back:)
    @attack = attacker.value
    @attacker = attacker

    @front_health = front.value
    @front = front

    @back_health = back.value
    @back = back
  end

  def to_s
    "#{attacker}|#{front}:#{back}"
  end

  def resolve
    front_health = front.value - attack

    # Diamond defense bonus
    front_health += front.value if front.suit == Phalanx::Suits.diamond && back.suit != Phalanx::Suits.null

    @attack -= front.value

    # Heart defense bonus
    @attack -= front.value if front.suit == Phalanx::Suits.heart && back.suit == Phalanx::Suits.null

    back_health = back.value - attack

    # Club attack bonus
    back_health -= attack if attacker.suit == Phalanx::Suits.club

    @attack -= back.value

    # Heart defense bonus
    @attack -= back.value if back.suit == Phalanx::Suits.heart

    # Spade attack bonus
    @attack += attack if attacker.suit == Phalanx::Suits.spade

    {
      to_s => {
        damage: attack,
        rows: { front: front_health, back: back_health }
      }
    }
  end
end

ATTACKER_VALUE_RANGE = FRONT_VALUE_RANGE = BACK_VALUE_RANGE = (1..11)
ATTACKER_SUITS = FRONT_SUITS = BACK_SUITS = [Phalanx::Suits.spade, Phalanx::Suits.heart, Phalanx::Suits.club,
                                             Phalanx::Suits.diamond, Phalanx::Suits.null].freeze

ATTACKER_SUITS.each do |attacker_suit|
  ATTACKER_VALUE_RANGE.each do |attacker_value|
    FRONT_SUITS.each do |front_suit|
      FRONT_VALUE_RANGE.each do |front_value|
        BACK_SUITS.each do |back_suit|
          BACK_VALUE_RANGE.each do |back_value|
            next if attacker_suit == Phalanx::Suits.null
            next if front_suit == Phalanx::Suits.null && back_suit != Phalanx::Suits.null

            attacker = Phalanx::Card.new(suit: attacker_suit, value: attacker_value)
            front = Phalanx::Card.new(suit: front_suit, value: front_value)
            back = Phalanx::Card.new(suit: back_suit, value: back_value)

            battle = Battle.new(attacker:, front:, back:).resolve

            ap battle
          end
        end
      end
    end
  end
end
