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
      allow(game.board).to receive(:drop_piece).and_return(false, true)
      allow(game.board).to receive(:display)
      allow(subject).to receive(:win?)
    end

    after :each do
      game.start
    end

    it 'drops piece into board until board is full' do
      expect(game.board).to receive(:drop_piece).exactly(5).times
    end

    it 'displays board every move' do
      expect(game.board).to receive(:display).and_return('').exactly(4).times
    end
  end

  describe '#win?' do
    subject(:game) { Game.new }

    context 'vertical check' do
      before :each do
        game.board.drop_piece('w', 0)
        game.board.drop_piece('w', 0)
        game.board.drop_piece('w', 0)
        game.board.drop_piece('w', 0)
      end

      it 'returns true if 4 lines of same piece line up' do
        expect(game.win?('w', 0)).to be true
      end

      it 'returns false if no 4 pieces line up' do
        expect(game.win?('w', 1)).to be false
      end
    end
  end
end
