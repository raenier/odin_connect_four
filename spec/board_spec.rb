require 'board'

describe Board do
  describe '#new' do
    subject(:new_board) { described_class.new(6, 7) }
    it 'sets board size' do
      expect(new_board.size).to eql [6, 7]
    end

    context 'on setting up cage' do
      it 'returns array' do
        expect(new_board.cage).to be_an Array
      end

      it 'creates cage height based on board size' do
        expect(new_board.cage.size).to eql(6)
      end

      it 'creates cage width based on board size' do
        expect(new_board.cage.last).to be_an Array
        expect(new_board.cage.last.size).to eql(7)
      end
    end
  end

  describe '#drop_piece' do
    subject(:new_board) { described_class.new(6, 7) }

    it 'drop piece on 2D Array of column choice' do
      new_board.drop_piece('w', 5)
      expect(new_board.cage[0][5]).to eql('w')
    end

    it 'drops on next row if cell already has piece' do
      new_board.drop_piece('w', 5)
      new_board.drop_piece('w', 5)
      expect(new_board.cage[1][5]).to eql('w')
      expect(new_board.cage[2][5]).to be_nil
    end

    context 'row is full' do
      before :each do
        6.times { new_board.drop_piece('w', 5) }
      end

      it 'returns false' do
        expect(new_board.drop_piece('w', 5)).to be(false)
      end
    end

    context 'dropping outside of board size' do
      it 'returns false' do
        expect(new_board.drop_piece('w', 7)).to be false
      end
    end
  end

  describe '#full?' do
    subject(:new_board) { described_class.new(6, 7) }

    it 'returns true if board is full' do
      new_board.cage = Array.new(1) { Array.new(7, 'x') }

      expect(new_board.full?).to be true
    end

    it 'returns false if board is not full' do
      expect(new_board.full?).to be false
    end
  end
end
