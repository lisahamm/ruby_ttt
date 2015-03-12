module TicTacToe
  class Game
    attr_accessor :board, :current_player_mark
    attr_reader :player1, :player2

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
      board.set_cell(cell_number, current_player_mark)
      switch_turn
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
  end
end