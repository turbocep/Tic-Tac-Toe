# frozen_string_literal: true

# The game class.
class Game
  def initialize
    @round = 1
  end
end

# The main board.
class Board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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
end

# Player class
class Player
  attr_reader :name, :symbol, :bot

  def initialize(name, symbol, bot)
    self.name = name
    self.symbol = symbol
    self.bot = bot
  end
end

board = Board.new

board.show
