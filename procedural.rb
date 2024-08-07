board = %w[1 2 3 4 5 6 7 8 9]
turn = 1
game_going = true

def display_board(board)
  (0..2).each do |i|
    p board[(i * 3)...(i * 3 + 3)]
  end
end

player_choice = gets if turn.odd? while game_going
