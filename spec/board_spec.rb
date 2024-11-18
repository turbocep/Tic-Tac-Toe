require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    context 'when board is constructed' do
      it "creates 3x3 array of ' '" do
        result = Board.new.instance_variable_get('@board')
        expectation = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
        expect(result).to eql(expectation)
      end
    end
  end

  describe '#win?' do
    context 'when board is empty' do
      it 'returns false' do
        board = Board.new([
                            [' ', ' ', ' '],
                            [' ', ' ', ' '],
                            [' ', ' ', ' ']
                          ])
        expect(board.win?).to be false
      end
    end
    context 'when no winning conditions' do
      it 'returns false' do
        board = Board.new([
                            %w[X O O],
                            %w[O X X],
                            %w[X O O]
                          ])
        expect(board.win?).to be false
      end
    end
    describe 'horizontal win conditions' do
      context 'when first row is full' do
        it 'returns true' do
          board = Board.new([
                              %w[O O O],
                              %w[O X X],
                              %w[X O O]
                            ])
          expect(board.win?).to be true
          # Do I need to test all three cases?
        end
      end
      context 'when second row is full' do
        it 'returns true' do
          board = Board.new([
                              %w[O X O],
                              %w[X X X],
                              %w[X O O]
                            ])
          expect(board.win?).to be true
          # Do I need to test all three cases?
        end
      end
      context 'when last row is full' do
        it 'returns true' do
          board = Board.new([
                              %w[X O O],
                              %w[O X X],
                              %w[O O O]
                            ])
          expect(board.win?).to be true
          # Do I need to test all three cases?
        end
      end
    end

    describe 'vertical win conditions' do
      context 'consecutive three in column 1' do
        it 'returns true' do
          board = Board.new([
                              %w[O X O],
                              %w[O X X],
                              %w[O O X]
                            ])
          expect(board.win?).to be true
        end
      end
      context 'consecutive three in column 2' do
        it 'returns true' do
          board = Board.new([
                              %w[X X O],
                              %w[O X X],
                              %w[O X X]
                            ])
          expect(board.win?).to be true
        end
      end
      context 'consecutive three in column 3' do
        it 'returns true' do
          board = Board.new([
                              %w[O X X],
                              %w[O O X],
                              %w[O O X]
                            ])
          expect(board.win?).to be true
        end
      end
    end
    describe 'diagonal win conditions' do
      context 'starting from top-left' do
        it 'returns true' do
          board = Board.new([
                              %w[X X O],
                              %w[O X X],
                              %w[O O X]
                            ])
          expect(board.win?).to be true
        end
      end
      context 'starting from top-right' do
        it 'returns true' do
          board = Board.new([
                              %w[X X O],
                              %w[O O X],
                              %w[O X X]
                            ])
          expect(board.win?).to be true
        end
      end
    end
  end
end