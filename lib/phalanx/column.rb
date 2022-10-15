# frozen_string_literal: true

module Phalanx
  class Column
    attr_reader :front, :back

    def initialize(front:, back:)
      @front = front
      @back = back
    end
  end
end
