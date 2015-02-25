module TicTacToe
  class Game
    attr_accessor :board

    def initialize(board, player1, player2)
      @board = board
      @players = [player1, player2]
      @current_player = player1
    end

    def play
      while in_progress?
        take_turn
        switch_turn
      end
    end

    def in_progress?
      !winner? && !tie?
    end

    def winner?
      board.winner?
    end

    def get_winning_player
      if board.get_winning_mark == players[0].mark
        players[0]
      elsif board.get_winning_mark == players[1].mark
        players[1]
      else
        nil
      end
    end

    def tie?
      board.tie_game?
    end

    private

    attr_accessor :players, :current_player

    def take_turn
      current_player.take_turn(board)
    end

    def switch_turn
      self.current_player = current_player == players[0] ? players[1] : players[0]
    end
  end
end