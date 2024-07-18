#I'm doing a brain-dump of code all in one file. I'll sort into a 
#nicer structure later.

class Board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  #Basic paint function is good enough for now while the main
  #algorithm is the big priority. 
  def paint
    for i in 0..2 do
      p @board[(i * 3)...(i * 3 + 3)]
    end
  end

  #Writes to certain index. 
end

new_board = Board.new()

new_board.paint




