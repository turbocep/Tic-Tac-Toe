require_relative '../lib/player'

describe Player do
  describe '#name' do
    context "when name is 'Player 1'" do
      it "returns string 'Player 1" do
        player = Player.new('Player 1')
        result = player.name
        expect(result).to eql('Player 1')
      end
    end
    context 'when no name is given' do
      it "returns 'anonymous'" do
        expect(Player.new.name).to eql('anonymous')
      end
    end
  end
  describe '#type' do
    context 'when no type specified' do
      it 'returns symbol :user' do
        player = Player.new('Player 1')
        result = player.type
        expect(result).to be :user
      end
    end
    context 'when :bot_easy type specified' do
      it 'returns symbol :bot_easy' do
        player = Player.new('Player 1', :bot_easy)
        result = player.type
        expect(result).to be :bot_easy
      end
    end
  end
  describe '#select_move' do
    context 'when player type is :user' do
      it 'calls #user_input' do
        player = Player.new
        expect(player).to receive(:user_input)
        player.select_move(Board.new)
      end
    end
  end
  describe '#valid_input?' do
    context 'when input is invalid' do
      it 'returns false' do
        board = Board.new([%w[X X O], %w[X O X], [' ', ' ', ' ']].flatten)
        player = Player.new
        move = 9
        expect(player.valid_input?(move, board)).to be false
      end
    end
    context 'when input is valid' do
      it 'returns true' do
        board = Board.new([%w[X X O], %w[X O X], [' ', ' ', ' ']].flatten)
        player = Player.new
        move = 8
        expect(player.valid_input?(move, board)).to be true
      end
    end
  end
end
