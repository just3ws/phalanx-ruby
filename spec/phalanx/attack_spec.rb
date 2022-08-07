# frozen_string_literal: true

require 'pry'

require 'spec_helper'

require 'phalanx/attack'

RSpec.shared_context 'attackable', shared_context: :metadata do
  subject(:attack) { described_class.new(attacker:, front:, back:) }

  context 'attacker card' do
    it { expect(attack.attacker.suit).to eq(attacker.suit) }
    it { expect(attack.damage).to eq(attacker.value) }
  end

  context 'front card' do
    it { expect(attack.front.suit).to eq(front.suit) }
    it { expect(attack.front_health).to eq(front.value) }
  end

  context 'back card' do
    it { expect(attack.back.suit).to eq(back.suit) }
    it { expect(attack.back_health).to eq(back.value) }
  end

  describe '#attack!' do
    before { attack.attack }

    context 'damage' do
      it { expect(attack.damage).to be_positive }
      it { expect(attack.damage).to eq(expected.damage) }
    end

    context 'front card' do
      it { expect(attack.front_health).to be_negative }
      it { expect(attack.front_health).to eq(expected.front_health) }
    end

    context 'back card' do
      it { expect(attack.back_health).to be_negative }
      it { expect(attack.back_health).to eq(expected.back_health) }
    end
  end
end

module Phalanx
  include Cards

  ExpectedBattleState = Struct.new('ExpectedBattleState', :damage, :front_health, :back_health)

  RSpec.describe Attack do
    describe '.parse' do
      let(:signature) { 'D7|C2:S8' }

      subject(:attack) { described_class.parse(signature) }

      it { expect(attack.attacker).to eq(Diamond.new(value: 7)) }

      it { expect(attack.front).to eq(Club.new(value: 2)) }
      it { expect(attack.back).to eq(Spade.new(value: 8)) }
    end

    context 'D9|N0:N0' do
      let(:signature) { 'D7|C2:S8' }
      let(:expected) { ExpectedBattleState.new(9, -9, -9) }
      let(:attacker) { Diamond.new(value: 9) }
      let(:front) { Null.new }
      let(:back) { Null.new }

      subject(:attack) { described_class.parse(signature) }

      include_examples 'attackable'
    end

    context 'H9|N0:N0' do
      let(:attacker) { Heart.new(value: 9) }
      let(:front) { Null.new }
      let(:back) { Null.new }

      let(:expected) { ExpectedBattleState.new(9, -9, -9) }

      include_examples 'attackable'
    end

    context 'S9|N0:N0' do
      let(:attacker) { Spade.new(value: 9) }
      let(:front) { Null.new }
      let(:back) { Null.new }

      let(:expected) { ExpectedBattleState.new(18, -9, -9) }

      include_examples 'attackable'
    end

    context 'C9|N0:N0' do
      let(:attacker) { Club.new(value: 9) }
      let(:front) { Null.new }
      let(:back) { Null.new }

      let(:expected) { ExpectedBattleState.new(9, -9, -18) }

      include_examples 'attackable'
    end

    context 'C9|D3:D2' do
      let(:attacker) { Club.new(value: 9) }
      let(:front) { Diamond.new(value: 3) }
      let(:back) { Diamond.new(value: 2) }

      let(:expected) { ExpectedBattleState.new(4, -3, -10) }

      include_examples 'attackable'
    end

    context 'C7|D3:D2' do
      let(:attacker) { Club.new(value: 7) }
      let(:front) { Diamond.new(value: 3) }
      let(:back) { Diamond.new(value: 2) }

      let(:expected) { ExpectedBattleState.new(2, -1, -6) }

      include_examples 'attackable'
    end

    context 'C|D:H'
    context 'C|D:X'
    context 'C|D:_'
    context 'C|H:D'
    context 'C|H:H'
    context 'C|H:X'
    context 'C|H:_'
    context 'C|X:D'
    context 'C|X:H'
    context 'C|X:X'
    context 'C|X:_'
    context 'C|_:_'

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
    #     let(:back) { Null.new }
    #     let(:front) { Null.new }
    #     let(:value) { 9 }

    #     it 'deals all damage to player' do
    #       expect(attack.attack).to eq(value)
    #     end
    #   end
    # end

    # context 'D |' do
    #   let(:suit) { Suits.diamond }

    #   context '_:_' do
    #     let(:attacker) { Card.new(suit:, value:) }
    #     let(:back) { Null.new }
    #     let(:front) { Null.new }
    #     let(:value) { 9 }

    #     it 'deals all damage to player' do
    #       expect(attack.attack).to eq(value)
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
    #     let(:back) { Null.new }
    #     let(:front) { Null.new }
    #     let(:value) { 9 }

    #     it 'deals all damage to player' do
    #       expect(attack.attack).to eq(value)
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
    #     let(:back) { Null.new }
    #     let(:front) { Null.new }
    #     let(:value) { 9 }

    #     it 'deals double damage to player' do
    #       expect(attack.attack).to eq(value)
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

# class CardReport
#   attr_reader :card, :health
#
#   def initialize(card:, health:)
#     @card = card
#     @health = health
#   end
#
#   def alive?
#     health.positive?
#   end
#
#   def dead?
#     health.negative? || health.zero?
#   end
# end
#
# class BattleReport
#   attr_reader :attack, :front, :back
#
#   def initialize(attack:)
#     @attack = attack
#
#     @front = CardReport.new(card: attack.front, health: attack.front_health)
#     @back = CardReport.new(card: attack.back, health: attack.back_health)
#   end
#
#   def player_damage
#     attack.damage
#   end
#
#   def front_alive?
#     front.alive?
#   end
#
#   def back_alive?
#     back.alive?
#   end
#
#   def to_s
#     @attack.to_s
#   end
# end
