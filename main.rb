# frozen_string_literal: true

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

class Player
end

board = Board.new

board.show
