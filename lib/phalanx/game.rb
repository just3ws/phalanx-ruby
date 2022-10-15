# frozen_string_literal: true

module Phalanx
  class Game
    attr_reader :player1, :player2, :state

    def initialize(player1:, player2:)
      @player1 = player1
      player1.draw!(12)
      player1.deploy!

      @player2 = player2
      player2.draw!(12)
      player2.deploy!
    end
  end
end
