module TicTacToe

  class Board
    attr_reader :size, :cells

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

    def empty_cell?(cell_number)
      cells[cell_number].symbol == nil
    end

    def empty_cells
      available_cells = []
      cells.each {|cell| available_cells << (cell.index) if empty_cell?(cell.index)}
      available_cells
    end

    def empty?
      cells.all? {|cell| cell.symbol.nil?}
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
  end
end