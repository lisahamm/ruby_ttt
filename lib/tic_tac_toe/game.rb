module TicTacToe
  class Game
    attr_reader :player1, :player2, :current_player_mark, :board

    def initialize(player1_mark, player2_mark, current_player_mark, board=nil)
      @board = board ||= Board.new
      @player1 = player1_mark
      @player2 = player2_mark
      @current_player_mark = current_player_mark
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
      @current_player_mark = current_player_mark == 'X' ? 'O' : 'X'
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
      end
    end

    def tie?
      board.tie_game?
    end

    private

    def valid_move?(cell_number)
      valid_cell_number?(cell_number) && board.empty_cell?(cell_number)
    end

    def valid_cell_number?(cell_number)
      board.valid_cell_number?(cell_number)
    end

  end
end