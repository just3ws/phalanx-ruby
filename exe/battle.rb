#!/usr/bin/env ruby
# frozen_string_literal: true

require 'amazing_print'
require_relative '../lib/phalanx/attack'

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

            attack = Phalanx::Attack.new(
              attacker:,
              front:,
              back:
            ).resolve

            ap attack
          end
        end
      end
    end
  end
end
