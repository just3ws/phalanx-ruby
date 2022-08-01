# frozen_string_literal: true

module Phalanx
  module Suits
    CLUB = '♣'
    DIAMOND = '♦'
    HEART = '♥'
    SPADE = '♠'

    ALL = [CLUB, DIAMOND, HEART, SPADE].freeze

    def self.null = ''
    def self.club = CLUB
    def self.diamond = DIAMOND
    def self.heart = HEART
    def self.spade = SPADE
    def self.all = ALL
  end
end
