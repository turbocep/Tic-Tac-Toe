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

      won = @board.check_for_wins if @round >= 5
      puts @round
      @round += 1
      break if won
    end
    puts 'Game over.'
  end
end

# LOOP while nobody has won and there are turns left.
# Show the board.
# IF it's player1's turn, ask for their input.
#   Modify board with player1's input.
# ELSE IF it's player2's turn, asl for their input.
#   Modify board with player2's input.

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
  def check_for_wins
    win_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    won = false

    %w[X O].each do |symbol|
      win_combos.each do |combo|
        new_arr = []
        combo.each do |i|
          new_arr.push(@board[i])
        end
        if new_arr.all?(symbol)
          puts "#{symbol} won!"
          won = true
        end
      end
    end
    won
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
