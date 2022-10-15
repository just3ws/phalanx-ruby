# frozen_string_literal: true

RSpec.describe Phalanx::Column do
  subject(:column) { described_class.new(front:, back:) }

  let(:front) { Phalanx::Card.new(pip: :spade, val: 3) }
  let(:back) { Phalanx::Card.new(pip: :club, val: 5) }

  it { expect(column).to be_instance_of(described_class) }
end
