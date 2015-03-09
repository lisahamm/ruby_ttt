module TicTacToe
  class Game
    attr_accessor :board, :current_player
    attr_reader :player1, :player2

    def initialize(board, player1_mark, player2_mark)
      @board = board
      @player1 = Player.new(player1_mark)
      @player2 = Player.new(player2_mark)
      @current_player = player1
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