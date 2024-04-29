require 'game'

describe Game do
  describe '#initialize' do
    subject(:game) { Game.new }

    it 'creates one board' do
      expect(game.board).to be_a Board
    end
  end
end
