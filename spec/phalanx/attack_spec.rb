# frozen_string_literal: true

require 'spec_helper'

require 'phalanx/attack'

module Phalanx
  RSpec.describe Attack do
    subject(:attack) { described_class.new(attacker:, front:, back:) }

    context 'C' do
      context 'D:D' do
        let(:attacker) { Cards::Club.new(value: 7) }
        let(:front) { Cards::Diamond.new(value: 3) }
        let(:back) { Cards::Diamond.new(value: 2) }

        it {
          ap attacker
          ap front
          ap back

          ap attack
        }

      end

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
      context '_:_'
    end

    context 'X' do
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
      context '_:_'
    end

    context 'S' do
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
      context '_:_'
    end

    # context 'H |' do
    #   let(:suit) { Suits.heart }

    #   context '_:_' do
    #     let(:attacker) { Card.new(suit:, value:) }
    #     let(:back) { Cards::Null.new }
    #     let(:front) { Cards::Null.new }
    #     let(:value) { 9 }

    #     it 'deals all damage to player' do
    #       expect(attack.resolve).to eq(value)
    #     end
    #   end
    # end

    # context 'D |' do
    #   let(:suit) { Suits.diamond }

    #   context '_:_' do
    #     let(:attacker) { Card.new(suit:, value:) }
    #     let(:back) { Cards::Null.new }
    #     let(:front) { Cards::Null.new }
    #     let(:value) { 9 }

    #     it 'deals all damage to player' do
    #       expect(attack.resolve).to eq(value)
    #     end
    #   end

    #   context 'D:D'
    #   context 'D:H'
    #   context 'D:X'
    #   context 'D:_'
    #   context 'H:D'
    #   context 'H:H'
    #   context 'H:X'
    #   context 'H:_'
    #   context 'X:D'
    #   context 'X:H'
    #   context 'X:X'
    #   context 'X:_'
    # end

    # context 'C' do
    #   let(:suit) { Suits.club }

    #   context '_:_' do
    #     let(:attacker) { Card.new(suit:, value:) }
    #     let(:back) { Cards::Null.new }
    #     let(:front) { Cards::Null.new }
    #     let(:value) { 9 }

    #     it 'deals all damage to player' do
    #       expect(attack.resolve).to eq(value)
    #     end
    #   end

    #   # DD
    #   # DH
    #   # DX
    #   # D_
    #   # HD
    #   # HH
    #   # HX
    #   # H_
    #   # XD
    #   # XH
    #   # XX
    #   # X_
    #   # __
    # end

    # xcontext 'S' do
    #   let(:suit) { Suits.spade }

    #   context '_:_' do
    #     let(:attacker) { Card.new(suit:, value:) }
    #     let(:back) { Cards::Null.new }
    #     let(:front) { Cards::Null.new }
    #     let(:value) { 9 }

    #     it 'deals double damage to player' do
    #       expect(attack.resolve).to eq(value)
    #     end
    #   end

    #   # DD
    #   # DH
    #   # DX
    #   # D_
    #   # HD
    #   # HH
    #   # HX
    #   # H_
    #   # XD
    #   # XH
    #   # XX
    #   # X_
    #   # __
    # end
  end
end
