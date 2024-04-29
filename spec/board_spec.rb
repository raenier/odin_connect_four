require 'board'

describe Board do
  describe '#new' do
    subject(:new_board) { described_class.new(6, 7) }
    it 'sets board size' do
      expect(new_board.size).to eql [6, 7]
    end
  end

  describe '#put_piece' do
    subject(:new_board) { described_class.new(6, 7) }

    it 'put piece on a hashmap' do
      new_board.put_piece('w', 5, 4)
      expect(new_board.occupied_spaces[[5, 4]]).to eql('w')
    end

    context 'restrict_pieces that go off board' do
      it 'restrict negative y moves' do
        expect(new_board.put_piece('w', -1 , 2)).to eql('Invalid Move')
      end

      it 'restrict negative x moves' do
        expect(new_board.put_piece('w', 1 , -2)).to eql('Invalid Move')
      end

      it 'restrict move y greater than size of table' do
        expect(new_board.put_piece('w', 7, 2)).to eql('Invalid Move')
      end

      it 'restrict move x greater than size of table' do
        expect(new_board.put_piece('w', 1, 7)).to eql('Invalid Move')
      end
    end
  end
end
