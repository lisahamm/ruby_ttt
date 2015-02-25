module TicTacToe
  class HumanPlayer < Player

    def take_turn(board, cell_number)
      board.set_cell(cell_number, mark)
    end
  end
end
