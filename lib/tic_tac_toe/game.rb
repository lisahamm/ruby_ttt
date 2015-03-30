module TicTacToe
  class Game
    attr_reader :player1, :player2, :current_player_mark, :board, :ai_mark, :rules

    def initialize(player1:, player2:, current_player_mark:, ai_mark:, board: nil)
      @board = board ||= Board.new
      @player1 = player1
      @player2 = player2
      @current_player_mark = current_player_mark
      @ai_mark = ai_mark
      @rules = Rules.new(board)
    end

    def player1_mark
      player1.mark
    end

    def player2_mark
      player2.mark
    end

    def board_to_array
      board.to_array
    end

    def current_player
      current_player_mark == player1_mark ? player1 : player2
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
      TicTacToe::AI.new(current_player_mark, rules.player_marks).get_move(board)
    end

    def in_progress?
      !winner? && !tie?
    end

    def over?
      rules.over?
    end

    def get_winning_player
      if rules.get_winning_mark == player1.mark
        player1.mark
      elsif rules.get_winning_mark == player2.mark
        player2.mark
      end
    end

    def winner?
      rules.winner?
    end

    def tie?
      rules.tie_game?
    end

    private

    def switch_turn
      @current_player_mark = current_player_mark == player1_mark ? player2_mark : player1_mark
    end

    def valid_move?(cell_number)
      rules.valid_cell_number?(cell_number) && board.empty_cell?(cell_number)
    end
  end
end