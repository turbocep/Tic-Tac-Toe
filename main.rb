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

player = Player.new('Bob', 'X', true)
