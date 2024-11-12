require_relative 'game'

# Player class
class Player
  attr_accessor :name, :symbol, :bot

  def initialize(name, symbol, bot)
    self.name = name
    self.symbol = symbol
    self.bot = bot
  end

  def choose_move(available)
    bot ? available.sample : gets.to_i
  end
end
