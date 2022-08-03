# frozen_string_literal: true

module Phalanx
  module Suits
    CLUB_GLYPH = '♣'
    CLUB_LETTER = 'C'

    DIAMOND_GLYPH = '♦'
    DIAMOND_LETTER = 'D'

    HEART_GLYPH = '♥'
    HEART_LETTER = 'H'

    NULL_GLYPH = '∅'
    NULL_LETTER = 'N'

    SPADE_GLYPH = '♠'
    SPADE_LETTER = 'S'

    ALL_GLYPHS = [CLUB_GLYPH, DIAMOND_GLYPH, HEART_GLYPH, SPADE_GLYPH, NULL_GLYPH].freeze
    ALL_LETTERS = [CLUB_LETTER, DIAMOND_LETTER, HEART_LETTER, SPADE_LETTER, NULL_LETTER].freeze

    REAL_GLYPHS = [CLUB_GLYPH, DIAMOND_GLYPH, HEART_GLYPH, SPADE_GLYPH].freeze
    REAL_LETTERS = [CLUB_LETTER, DIAMOND_LETTER, HEART_LETTER, SPADE_LETTER].freeze

    def self.null = NULL_GLYPH
    def self.club = CLUB_GLYPH
    def self.diamond = DIAMOND_GLYPH
    def self.heart = HEART_GLYPH
    def self.spade = SPADE_GLYPH
    def self.real = REAL_GLYPHS
    def self.all = ALL_GLYPHS
  end
end
