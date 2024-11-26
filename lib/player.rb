require_relative 'board'

# Stores player states
class Player
  attr_reader :name, :type, :char

  def initialize(name = 'anonymous', type = :user, char = 'X')
    @name = name
    @type = type
    @char = char
  end

  @@moves = { A1: 0, A2: 1, A3: 2, B1: 3, B2: 4, B3: 5, C1: 6, C2: 7, C3: 8 }

  # Could I include this in the initialize method? Define the method of getting
  # a move when the player is constructed, so I don't have to constantly check # the player type?

  # Script method
  def select_move(board)
    case type
    when :user then user_input(board)
    when :bot_easy then random_move(board)
    end
  end

  def user_input(board)
    move = nil
    until valid_input?(move, board)
      puts ">>#{@name}, enter your move:"
      move = @@moves[gets.chomp.to_sym]
    end
    move
  end

  def valid_input?(move, board)
    board.available_moves.include?(move)
  end

  def random_move(board)
    puts ">>#{@name} is carefully selecting their move..."
    board.available_moves.sample
  end
end
