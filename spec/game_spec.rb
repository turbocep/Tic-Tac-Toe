require_relative '../lib/game'
require_relative '../lib/player'

describe Game do
  describe '#initialize' do
    subject(:game) { described_class.new }
    it 'assigns new board instance to @board' do
      result = game.instance_variable_get('@board')
      expect(result).to be_a(Board)
    end
    it 'creates non-empty array' do
      result = game.instance_variable_get('@players')
      expect(result).not_to be_empty
    end
    it 'creates round counter equal to 1' do
      result = game.instance_variable_get('@round')
      expect(result).to eql(1)
    end
  end
  describe '#game_over?' do
    context 'when player won' do
      context 'when no moves left' do
        it 'returns true' do
          board = [%w[X X X], %w[X O O], %w[O X O]].flatten
          game = Game.new(Board.new(board))
          expect(game.game_over?).to be true
        end
      end
      context 'when moves left' do
        it 'returns true' do
          board = [%w[X X X], %w[X O O], [' ', ' ', ' ']].flatten
          game = Game.new(Board.new(board))
          expect(game.game_over?).to be true
        end
      end
    end
    context 'when nobody won' do
      context 'when no moves left' do
        it 'returns true' do
          board = [%w[X O X], %w[O X O], %w[X O O]].flatten
          game = Game.new(Board.new(board))
          expect(game.game_over?).to be true
        end
      end
      context 'when moves left' do
        it 'returns false' do
          board = [%w[X O X], %w[O X O], [' ', ' ', ' ']].flatten
          game = Game.new(Board.new(board))
          expect(game.game_over?).to be false
        end
      end
    end
  end
  describe '#game_loop' do
  end
end
