require 'player'

describe Player do
  describe "#initialize" do
    subject(:new_player) { described_class.new(piece_color) }
    context "value is 'w'" do
      let(:piece_color) { 'w' }
      it "assigns piece_color to player" do
        expect(new_player.piece).to eq("w")
      end
    end

    context "value is 'b'" do
      let(:piece_color) { 'b' }
      it "assigns piece_color to player" do
        expect(new_player.piece).to eq("b")
      end
    end

    context 'calling piece' do
      let(:piece_color) { 'w' }
      it 'cant change piece value' do
        expect{ new_player.piece = 'b' }.to raise_exception(NoMethodError)
        expect(new_player.piece).to eq("w")
      end
     end
  end

  describe '#move' do
    subject(:player) { described_class.new("w") }
    before do
      allow(player).to receive(:player_input).and_return('12')
    end

    it 'gets input from player' do
      expect(player).to receive(:player_input).once
      player.move
    end

    context 'with value 12' do
      before do
        allow(player).to receive(:player_input).and_return('12')
      end
      it 'returns number array' do
        expect(player.move).to eq([1, 2])
      end
    end

    context 'with value 23' do
      before do
        allow(player).to receive(:player_input).and_return('23')
      end
      it 'returns number array' do
        expect(player.move).to eq([2, 3])
      end
    end
  end

  describe '#player_input' do
    subject(:player) { described_class.new('w') }

    context '1 valid input' do
      before do
        allow(player).to receive(:gets).and_return('12')
      end

      it 'gets input from player once' do
        expect(player).to receive(:gets).once
        player.player_input
      end
    end

    context '1 invalid and 1 valid input' do
      before do
        letter = 'asdf'
        valid = '12'
        allow(player).to receive(:gets).and_return(letter, valid)
      end

      it 'calls gets twice' do
        expect(player).to receive(:gets).twice
        player.player_input
      end
    end

    context '2 invalid and 1 valid input' do
      before do
        letter = 'asdf'
        length_greater_than_two = '1234'
        valid = '12'
        allow(player).to receive(:gets).and_return(letter, length_greater_than_two, valid)
      end

      it 'calls gets thrice' do
        expect(player).to receive(:gets).exactly(3).times
        player.player_input
      end
    end
  end
end
