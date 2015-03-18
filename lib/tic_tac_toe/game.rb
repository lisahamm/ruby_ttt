module TicTacToe
  class Game
    attr_accessor :board, :current_player_mark
    attr_reader :player1, :player2

    def initialize(options)
      options = defaults.merge(options)
      @board = options[:board]
      @player1 = options[:player1_mark]
      @player2 = options[:player2_mark]
      @current_player_mark = options[:current_player_mark]
    end

    def board_to_array
      board.to_array
    end

    def take_turn(cell_number)
      if valid_move?(cell_number)
        board.set_cell(cell_number, current_player_mark)
        switch_turn
        true
      else
        false
      end
    end

    def generate_ai_move
      TicTacToe::AI.new(current_player_mark).get_move(board)
    end

    def switch_turn
      self.current_player_mark = current_player_mark == 'X' ? 'O' : 'X'
    end

    def in_progress?
      !winner? && !tie?
    end

    def over?
      board.over?
    end

    def winner?
      board.winner?
    end

    def get_winning_player
      if board.get_winning_mark == player1
        player1
      elsif board.get_winning_mark == player2
        player2
      else
        nil
      end
    end

    def tie?
      board.tie_game?
    end

    private

    def defaults
      {board: Board.new, player1_mark: 'X', player2_mark: 'O', current_player_mark: 'X'}
    end

    def valid_move?(cell_number)
      valid_cell_range.include?(cell_number) && board.empty_cell?(cell_number)
    end

    def valid_cell_range
      0...(BOARD_SIZE ** 2)
    end

  end
end