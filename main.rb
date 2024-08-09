# rubocop: disable all
# frozen_string_literal: true

# The game class.
class Game
  def initialize
    @round = 1
  end
end

# The main board.
class Board < Game
  def initialize(board)
    @board = board
  end

  def show
    @board.each do |element|
      if [3, 6].include?(element)
        puts " #{element}"
      elsif element == 9
        puts " #{element}"
      else
        print " #{element}"
      end
    end
  end

  def available_moves
    @board.reject { |slot| ["X", "O"].include?(slot) }
  end

  #Start calling this method when @round >= 5.
  def check_for_wins
    win_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]


    ["X", "O"].each do |symbol|
      win_combos.each do |combo|
        new_arr = []
        combo.each do |i|
          new_arr.push(@board[i])
        end
        if new_arr.all?(symbol)
          puts "#{symbol} won!"
          break
        end
      end
    end
  end
end

# Player class
class Player < Game
  attr_reader :name, :symbol, :bot

  def initialize(name, symbol, bot)
    self.name = name
    self.symbol = symbol
    self.bot = bot
  end

  # Available is an array of slots that can still be played.
  def choose_move(available)
    if bot
      available.sample
    else
      gets.to_i
    end
  end
end

board1 = Board.new(["X", 2, 3, 4, "X", 6, 7, 8, "X"])

board1.check_for_wins

#TODO(Turbocep): Create Board and Players from Game class. No user input for player details currently. Create players => call player for input => get input, change board, change round, get other player's input. You can base whose turn it is based on odd and even numbers. The first player created starts first. 
