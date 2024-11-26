# frozen_string_literal: true

# Stores and manipulates board
class Board
  def initialize(board = Array.new(9, ' '))
    @board = board
    @board_string = render_board
    @win_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def to_s
    @board_string
  end

  # Command method
  def render_board # rubocop:disable Metrics/MethodLength
    @board_string = <<~HEREDOC
            1     2     3
          _____ _____ _____
         |     |     |     |
      A  |  #{@board[0]}  |  #{@board[1]}  |  #{@board[2]}  |
         |_____|_____|_____|
         |     |     |     |
      B  |  #{@board[3]}  |  #{@board[4]}  |  #{@board[5]}  |
         |_____|_____|_____|
         |     |     |     |
      C  |  #{@board[6]}  |  #{@board[7]}  |  #{@board[8]}  |
         |_____|_____|_____|
    HEREDOC
  end

  # Script and command method
  def update(char, index)
    @board[index] = char
    render_board
  end

  # Query method
  def win?
    @win_combos.each do |combo|
      a, b, c = *combo
      unique = [@board[a], @board[b], @board[c]].uniq
      return true if unique.length == 1 && unique != [' ']
    end
    false
  end

  def available_moves
    @board.map.with_index do |element, index|
      index if element == ' '
    end.compact
  end
end
