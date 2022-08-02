# frozen_string_literal: true

module Phalanx
  module Suits
    CLUB = '♣'
    DIAMOND = '♦'
    HEART = '♥'
    SPADE = '♠'
    NULL = '_'

    ALL = [CLUB, DIAMOND, HEART, SPADE].freeze

    def self.null = NULL
    def self.club = CLUB
    def self.diamond = DIAMOND
    def self.heart = HEART
    def self.spade = SPADE
    def self.all = ALL
  end
end
