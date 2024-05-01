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

  describe '#start' do
    subject(:game) { Game.new }
    before :each do
      allow_any_instance_of(Board).to receive(:full?).and_return(false, false, true)
      allow_any_instance_of(Player).to receive(:move).and_return('1', '2', '1', '2')
      allow_any_instance_of(Player).to receive(:piece).and_return('x', 'y', 'x', 'y')
      allow(game.board).to receive(:drop_piece).and_return(false, true)
      allow(game.board).to receive(:display)
    end

    after :each do
      game.start
    end

    it 'gets players move and piece until board is full' do
      expect(game.players.first).to receive(:move).thrice
      expect(game.players.last).to receive(:move).twice
      expect(game.players.first).to receive(:piece).thrice
      expect(game.players.last).to receive(:piece).twice
    end

    it 'drops piece into board until board is full' do
      expect(game.board).to receive(:drop_piece).exactly(5).times
    end

    it 'displays board every move' do
      expect(game.board).to receive(:display).and_return('').exactly(4).times
    end
  end
end
