# frozen_string_literal: true

module Phalanx
  module Suits
    CLUB    = '♣'
    DIAMOND = '♦'
    HEART   = '♥'
    SPADE   = '♠'
    NULL    = '∅'

    REAL = [CLUB, DIAMOND, HEART, SPADE].freeze
    ALL = [CLUB, DIAMOND, HEART, SPADE, NULL].freeze

    def self.null = NULL
    def self.club = CLUB
    def self.diamond = DIAMOND
    def self.heart = HEART
    def self.spade = SPADE
    def self.real = REAL
    def self.all = ALL
  end
end
