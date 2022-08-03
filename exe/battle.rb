#!/usr/bin/env ruby
# frozen_string_literal: true

require 'amazing_print'

require_relative '../lib/phalanx/values'
require_relative '../lib/phalanx/attack'

module Phalanx
  VALUES = Values.numbered_cards
  SUITS = Suits.all

  SUITS.each do |attacker_suit|
    VALUES.each do |attacker_value|
      SUITS.each do |front_suit|
        VALUES.each do |front_value|
          SUITS.each do |back_suit|
            VALUES.each do |back_value|
              next if attacker_suit == Suits.null
              next if front_suit == Suits.null && back_suit != Suits.null

              attacker = Card.new(suit: attacker_suit, value: attacker_value)
              front = Card.new(suit: front_suit, value: front_value)
              back = Card.new(suit: back_suit, value: back_value)

              attack = Attack.new(
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
end
