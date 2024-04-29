require 'board'

describe Board do
  describe '#new' do
    subject(:new_board) { described_class.new(6, 7) }
    it 'sets board size' do
      expect(new_board.size).to eql [6, 7]
    end
  end
end
