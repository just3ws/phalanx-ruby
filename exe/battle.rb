#!/usr/bin/env ruby
# frozen_string_literal: true

require 'amazing_print'
require 'sorted_set'
require 'json'

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

  def present?
    suit != NULL
  end
end

class Battle
  attr_accessor :damage
  attr_reader :attacker, :front, :back
  attr_accessor :front_health, :back_health

  def initialize(attacker)
    @damage = 0
    @attacker = attacker
  end

  def front=(card)
    @front = card
    @front_health = front.value
    @front
  end

  def back=(card)
    @back = card
    @back_health = back.value
    @back
  end

  def resolve
    hist = []
    damage = attacker.value
    hist << damage.to_s

    front_hist = []
    front_hist << '(front:'
    front_health = front.value
    front_hist << front_health.to_s
    front_health += front.value if front.suit == DIAMOND && back.suit != NULL
    front_hist << front_health.to_s
    front_health -= attacker.value
    front_hist << front_health.to_s
    front_health = 0 if front_health.negative?
    front_hist << front_health.to_s
    front_hist << "#{front_health})"
    hist << front_hist.to_a.join(' >> ').sub(/: >>/, ':')

    damage -= front.value
    hist << damage.to_s

    damage = 0 if damage.negative?
    hist << damage.to_s

    back_hist = []
    back_hist << '(back:'
    back_health = back.value
    back_hist << back_health.to_s
    back_health -= damage
    back_hist << back_health.to_s
    back_health -= damage if attacker.suit == CLUB
    back_hist << back_health.to_s
    back_health = 0 if back_health.negative?
    back_hist << "#{back_health})"
    hist << back_hist.to_a.join(' >> ').sub(/: >>/, ':')

    damage -= back.value
    hist << damage.to_s
    damage = 0 if damage.negative?
    hist << damage.to_s

    damage -= back.value if back.suit == HEART
    hist << damage.to_s
    damage = 0 if damage.negative?
    hist << damage.to_s

    damage += damage if attacker.suit == SPADE
    hist << damage.to_s

    report = [attacker, front, back, damage].join(', ')
    ap report
    ap hist

    report
  end
end

module Game
  def self.battler(attacker, front, back)
    battle = Battle.new(attacker)
    battle.front = front
    battle.back = back

    battle.resolve
  end
end

# VALUE_RANGE = (1..11)
ATTACK_VALUE_RANGE = (5..5)
FRONT_VALUE_RANGE = BACK_VALUE_RANGE = (2..9)

ATTACK_SUITS = [SPADE, HEART, CLUB, DIAMOND].freeze
# ATTACK_SUITS = [HEART].freeze
# FRONT_SUITS = [SPADE, HEART, CLUB, DIAMOND, NULL].freeze
# BACK_SUITS = [SPADE, HEART, CLUB, DIAMOND, NULL].freeze
# FRONT_SUITS = [SPADE, NULL].freeze
# BACK_SUITS = [SPADE, NULL].freeze
# FRONT_SUITS = BACK_SUITS = [SPADE, HEART, CLUB, DIAMOND, NULL].freeze
FRONT_SUITS = BACK_SUITS = [SPADE, NULL].freeze

ATTACK_SUITS.each do |attack_suit|
  ATTACK_VALUE_RANGE.each do |attack_value|
    FRONT_SUITS.each do |front_suit|
      FRONT_VALUE_RANGE.each do |front_value|
        BACK_SUITS.each do |back_suit|
          BACK_VALUE_RANGE.each do |back_value|

            next if attack_suit == NULL
            next if front_suit == NULL && back_suit != NULL

            Game.battler(
              Card.new(attack_suit, attack_value),
              Card.new(front_suit, front_value),
              Card.new(back_suit, back_value)
            )
          end
        end
      end
    end
  end
end

# games.each { |game| puts(game) }

# damage = 0 if damage.negative?
# front_health = 0 if front_health.negative?
# front_health = front.value if front_health.positive?
# back_health = 0 if back_health.negative?
# back_health = back.value if back_health.positive?
#
#
# player_damage = if damage.negative?
#                   "-#{damage.abs.to_s.rjust(2, '0')}"
#                 elsif damage.zero?
#                   " 00"
#                 else
#                   " #{damage.abs.to_s.rjust(2, '0')}"
#                 end

# front_state = if front_health.positive?
#                 'X'
#               else
#                 '_'
#               end

# back_state = if back_health.positive?
#                'X'
#              else
#                '_'
#              end

# # player_damage = if damage.negative?
# #                   0
# #                 else
# #                   damage
# #                 end
# player_damage = damage
# # "#{attacker.suit}|#{front.suit}#{back.suit} => (#{attacker} | #{front} #{back}) [#{front_state}#{back_state}] #{player_damage}"
# # "(#{attacker} | #{front} #{back}) [#{front_state}#{back_state}] #{player_damage}"
# "#{attacker},#{front},#{back},#{front_state},#{back_state},#{player_damage}"
