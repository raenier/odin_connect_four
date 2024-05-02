# frozen_string_literal: true

require 'player'

describe Player do
  describe '#initialize' do
    subject(:new_player) { described_class.new(piece_color) }
    context "value is 'w'" do
      let(:piece_color) { 'w' }
      it 'assigns piece_color to player' do
        expect(new_player.piece).to eq('w')
      end
    end

    context "value is 'b'" do
      let(:piece_color) { 'b' }
      it 'assigns piece_color to player' do
        expect(new_player.piece).to eq('b')
      end
    end

    context 'calling piece' do
      let(:piece_color) { 'w' }
      it 'cant change piece value' do
        expect { new_player.piece = 'b' }.to raise_exception(NoMethodError)
        expect(new_player.piece).to eq('w')
      end
    end
  end

  describe '#move' do
    subject(:player) { described_class.new('w') }
    before do
      allow(player).to receive(:gets).and_return('1')
    end

    context 'valid input' do
      it 'returns integer' do
        expect(player.move).to be_an Integer
      end
    end
  end
end
