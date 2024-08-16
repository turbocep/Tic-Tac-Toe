# frozen_string_literal: true

# The game class.
class Game
  def initialize
    @round = 1
    @board = Board.new([1, 2, 3, 4, 5, 6, 7, 8, 9])
    @players = [Player.new('user', 'X', false), Player.new('bot', 'O', true)]
  end

  def play
    puts 'Starting game.'
    @board.show
    i = 0
    won = false
    while @round <= 9
      current_player = @players[i]

      puts "#{current_player.name}'s turn. Select your move:"
      move = current_player.choose_move(@board.available_moves)
      @board.update(move, current_player.symbol)
      @board.show

      i = i.zero? ? 1 : 0

      won = @board.win? if @round >= 5
      puts @round
      @round += 1
      break if won
    end
    puts 'Game over.'
    if won
      if @round.even?
        puts 'Player 1 won.'
      else
        puts 'Player 2 won.'
      end
    else
      puts "It's a tie."
    end
  end
end

# The main board.
class Board < Game
  def initialize(board)
    @board = board
  end

  def show
    @board.each_with_index do |element, index|
      if [2, 5].include?(index)
        puts " #{element}"
      elsif index == 8
        puts " #{element}"
      else
        print " #{element}"
      end
    end
  end

  def available_moves
    @board.reject { |slot| %w[X O].include?(slot) }
  end

  def update(move, symbol)
    @board[move - 1] = symbol
  end

  # Start calling this method when @round >= 5.
  def win?
    win_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    win_combos.any? do |combo|
      [@board[combo[0]], @board[combo[1]], @board[combo[2]]].uniq.length == 1
    end
  end
end

# Player class
class Player < Game
  attr_accessor :name, :symbol, :bot

  def initialize(name, symbol, bot)
    self.name = name
    self.symbol = symbol
    self.bot = bot
  end

  # Available is an array of slots that can still be played.
  def choose_move(available)
    play = bot ? available.sample : gets.to_i
    puts "#{name} plays #{play}"
    play
  end
end

game = Game.new
game.play
