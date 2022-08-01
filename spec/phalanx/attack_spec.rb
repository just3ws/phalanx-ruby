# frozen_string_literal: true

require 'spec_helper'

require 'phalanx/cards'
require 'phalanx/attack'

module Phalanx
  RSpec.describe Attack do
    let(:attacker) { Cards::Diamond.new(suit: Suits.diamond, value: 7) }
    let(:front) { Cards::Club.new(suit: Suits.club, value: 3) }
    let(:back) { Cards::Spade.new(suit: Suits.spade, value: 2) }

    subject(:attack) { described_class.new(attacker, front, back) }

    it do
      ap [attacker, front, back]

      ap attack.resolve
    end

    context 'H |' do
      let(:suit) { Suits.heart }

      context '_:_' do
        let(:attacker) { Cards::Card.new(suit:, value:) }
        let(:back) { Cards::Null.new }
        let(:front) { Cards::Null.new }
        let(:value) { 9 }

        it 'deals all damage to player' do
          expect(attack.resolve).to eq(value)
        end
      end
    end

    context 'D |' do
      let(:suit) { Suits.diamond }

      context '_:_' do
        let(:attacker) { Cards::Card.new(suit:, value:) }
        let(:back) { Cards::Null.new }
        let(:front) { Cards::Null.new }
        let(:value) { 9 }

        it 'deals all damage to player' do
          expect(attack.resolve).to eq(value)
        end
      end

      context 'D:D'
      context 'D:H'
      context 'D:X'
      context 'D:_'
      context 'H:D'
      context 'H:H'
      context 'H:X'
      context 'H:_'
      context 'X:D'
      context 'X:H'
      context 'X:X'
      context 'X:_'
    end

    context 'C' do
      let(:suit) { Suits.club }

      context '_:_' do
        let(:attacker) { Cards::Card.new(suit:, value:) }
        let(:back) { Cards::Null.new }
        let(:front) { Cards::Null.new }
        let(:value) { 9 }

        it 'deals all damage to player' do
          expect(attack.resolve).to eq(value)
        end
      end

      # DD
      # DH
      # DX
      # D_
      # HD
      # HH
      # HX
      # H_
      # XD
      # XH
      # XX
      # X_
      # __
    end

    xcontext 'S' do
      let(:suit) { Suits.spade }

      context '_:_' do
        let(:attacker) { Card.new(suit:, value:) }
        let(:back) { Cards::Null.new }
        let(:front) { Cards::Null.new }
        let(:value) { 9 }

        it 'deals double damage to player' do
          expect(attack.resolve).to eq(value)
        end
      end

      # DD
      # DH
      # DX
      # D_
      # HD
      # HH
      # HX
      # H_
      # XD
      # XH
      # XX
      # X_
      # __
    end
  end
end
