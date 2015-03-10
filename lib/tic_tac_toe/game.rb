module TicTacToe
  class Game
    attr_accessor :board, :current_player
    attr_reader :player1, :player2

    def initialize(board, player_settings)
      @board = board
      @player1 = set_player(0, player_settings)
      @player2 = set_player(1, player_settings)
      @current_player = player1
    end

    def set_player(index, player_settings)
      mark = player_settings[index].fetch(:mark)
      ai = player_settings[index].fetch(:ai)
      Player.new(mark, ai)
    end

    def take_turn(cell_number)
      board.set_cell(cell_number, current_player.mark)
    end

    def switch_turn
      self.current_player = current_player == player1 ? player2 : player1
    end

    def in_progress?
      !winner? && !tie?
    end

    def winner?
      board.winner?
    end

    def get_winning_player
      if board.get_winning_mark == player1.mark
        player1
      elsif board.get_winning_mark == player2.mark
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