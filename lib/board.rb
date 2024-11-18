# Stores and manipulates board
class Board
  def initialize(board = Array.new(3) { Array.new(3, ' ') })
    @board = board
    @board_string = render_board
    @win_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
  end

  def to_s
    @board_string
  end

  # Command method
  def render_board
    @board_string = <<~HEREDOC
            1     2     3
          _____ _____ _____
         |     |     |     |
      A  |  #{@board[0][0]}  |  #{@board[0][1]}  |  #{@board[0][2]}  |
         |_____|_____|_____|
         |     |     |     |
      B  |  #{@board[1][0]}  |  #{@board[1][1]}  |  #{@board[1][2]}  |
         |_____|_____|_____|
         |     |     |     |
      C  |  #{@board[2][0]}  |  #{@board[2][1]}  |  #{@board[2][2]}  |
         |_____|_____|_____|
    HEREDOC
  end

  # Script and command method
  def update(char, column, row)
    @board[row][column] = char
    render_board
  end

  # Query method
  def win?
    @win_combos.each do |combo|
      board = @board.flatten
      a, b, c = *combo
      unique = [board[a], board[b], board[c]].uniq
      return true if unique.length == 1 && unique != [' ']
    end
    false
  end
end
