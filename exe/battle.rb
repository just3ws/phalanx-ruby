#!/usr/bin/env ruby
# frozen_string_literal: true

require 'amazing_print'

CLUB = 'C'
SPADE = 'S'
HEART = 'H'
DIAMOND = 'D'
NULL = 'N'

class Card
  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = suit == NULL ? 0 : value
  end

  def to_s
    [suit, value.to_s.rjust(1, '0')].join
  end
end

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
    front_health += front.value if front.suit == DIAMOND && back.suit != NULL

    @attack -= front.value

    # Heart defense bonus
    @attack -= front.value if front.suit == HEART && back.suit == NULL

    back_health = back.value - attack

    # Club attack bonus
    back_health -= attack if attacker.suit == CLUB

    @attack -= back.value

    # Heart defense bonus
    @attack -= back.value if back.suit == HEART

    # Spade attack bonus
    @attack += attack if attacker.suit == SPADE

    {
      to_s => {
        damage: attack,
        rows: { front: front_health, back: back_health }
      }
    }
  end
end

ATTACKER_VALUE_RANGE = FRONT_VALUE_RANGE = BACK_VALUE_RANGE = (1..11)
ATTACKER_SUITS = FRONT_SUITS = BACK_SUITS = [SPADE, HEART, CLUB, DIAMOND, NULL].freeze

battles = {}

ATTACKER_SUITS.each do |attacker_suit|
  ATTACKER_VALUE_RANGE.each do |attacker_value|
    FRONT_SUITS.each do |front_suit|
      FRONT_VALUE_RANGE.each do |front_value|
        BACK_SUITS.each do |back_suit|
          BACK_VALUE_RANGE.each do |back_value|
            next if attacker_suit == NULL
            next if front_suit == NULL && back_suit != NULL

            attacker = Card.new(attacker_suit, attacker_value)
            front = Card.new(front_suit, front_value)
            back = Card.new(back_suit, back_value)

            battle = Battle.new(attacker:, front:, back:).resolve

            battles.merge!(battle)
          end
        end
      end
    end
  end
end

ap battles
