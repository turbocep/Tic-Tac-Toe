require_relative 'board'
require_relative 'player'

# Game logic
class Game
  def initialize(board = Board.new)
    @board = board
    @players = [Player.new('Player 1', :user, 'X'), Player.new('Player 2', :user, 'O')]
    @round = 1
  end

  def welcome
    puts "Welcome to Tic-Tac-Toe #{@players.first.name} and #{@players.last.name}!!!"
    sleep(1)
    puts 'Let the game begin...'
  end

  def game_over?
    @board.win? || @board.available_moves.length.zero? # rubocop:disable Style/ZeroLengthPredicate
  end

  def game_loop
    welcome
    until game_over?
      current_player = @round.odd? ? @players.first : @players.last
      puts "<< It's #{current_player.name}'s turn"
      puts @board
      move = current_player.select_move(@board)
      @board.update(current_player.char, move)
      @round += 1
      sleep(0.3)
    end
    game_over(current_player)
  end

  def game_over(current_player)
    puts @board
    puts 'GAME OVER'
    if @board.win?
      puts "Player #{current_player.name} won!"
    else
      puts 'It was a tie.'
    end
  end

  def play
    game_loop
  end
end

Game.new.play
