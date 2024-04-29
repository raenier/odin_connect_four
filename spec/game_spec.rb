require 'game'

describe Game do
  describe '#initialize' do
    subject(:game) { Game.new }

    it 'creates one board' do
      expect(game.board).to be_a Board
    end

    it 'creates two players' do
      expect(game.players.first).to be_a Player
      expect(game.players.last).to be_a Player
    end
  end
end
