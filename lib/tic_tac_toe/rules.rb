module TicTacToe
  class Rules
    attr_reader :board

    def initialize(board)
      @board = board
    end

    def valid_cell_number?(cell_number)
      (0..(board.size ** 2 - 1)).include?(cell_number)
    end

    def over?
      winner? || tie_game?
    end

    def winner?
      get_winning_mark != nil
    end

    def tie_game?
      full? && !winner?
    end

    def get_winning_mark
      winning_solutions.each do |solution|
        cell1 = board.cells[solution[0]].symbol
        cell2 = board.cells[solution[1]].symbol
        cell3 = board.cells[solution[2]].symbol
        if cell1 == cell2 && cell1 == cell3 && cell1 != nil
          return cell1
        end
      end
      nil
    end

    def player_marks
      ["X", "O"]
    end

    private

    def winning_solutions
      [[0, 1, 2],
       [3, 4, 5],
       [6, 7, 8],
       [0, 3, 6],
       [1, 4, 7],
       [2, 5, 8],
       [0, 4, 8],
       [2, 4, 6]
      ]
    end

    def full?
      board.cells.none? {|cell| cell.symbol.nil?}
    end
  end
end