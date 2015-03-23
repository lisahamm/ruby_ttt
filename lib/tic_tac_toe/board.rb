module TicTacToe

  class Board
    attr_accessor :cells, :size

    BOARD_SIZE = 3

    def initialize(options={})
      options = defaults.merge(options)
      @size = options[:size]
      @cells = cellify(options[:cells] || Array.new(size*size) {nil})
    end

    def get_cell(cell_number)
      cells[cell_number].symbol
    end

    def set_cell(cell_number, player_mark)
      cells[cell_number].symbol = player_mark
    end

    def remove_mark(cell_number)
      cells[cell_number].symbol = nil
    end

    def valid_cell_number?(cell_number)
      (0..(size ** 2 - 1)).include?(cell_number)
    end

    def empty_cell?(cell_number)
      cells[cell_number].symbol == nil
    end

    def empty_cells
      available_cells = []
      cells.each {|cell| available_cells << (cell.index) if empty_cell?(cell.index)}
      available_cells
    end

    def get_winning_mark
      winning_solutions.each do |solution|
        cell1 = cells[solution[0]].symbol
        cell2 = cells[solution[1]].symbol
        cell3 = cells[solution[2]].symbol
        if cell1 == cell2 && cell1 == cell3 && cell1 != nil
          return cell1
        end
      end
      nil
    end

    def winner?
      get_winning_mark != nil
    end

    def tie_game?
      full? && !winner?
    end

    def empty?
      cells.all? {|cell| cell.symbol.nil?}
    end

    def over?
      winner? || tie_game?
    end

    def each_row
      cells.each_slice(size) {|group| yield group}
    end

    def to_array
      cells.map(&:symbol)
    end

    def self.from_array(array)
      Board.new(cells: array)
    end

    private

    def defaults
      {size: BOARD_SIZE, cells: nil}
    end

    Cell = Struct.new(:symbol, :index)

    def cellify(data)
      data.each_with_index.map {|symbol, index| Cell.new(symbol, index)}
    end

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
      cells.none? {|cell| cell.symbol.nil?}
    end
  end
end