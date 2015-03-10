module TicTacToe
  class Game
    attr_accessor :board, :current_player
    attr_reader :player1, :player2, :take_first_turn

    def initialize(board=nil, player_settings)
      @board = board ||= Board.new
      @player1 = set_player(0, player_settings)
      @player2 = set_player(1, player_settings)
      @current_player = player1
      check_first_move
    end

    def set_player(index, player_settings)
      mark = player_settings[index].fetch(:mark)
      Player.new(mark)
    end

    def check_first_move
      if player1.ai == true
        take_turn(generate_ai_move)
        switch_turn
      end
    end

    def take_turn(cell_number)
      cell_number = cell_number ||= generate_ai_move(board)
      board.set_cell(cell_number, current_player.mark)
    end

    def generate_ai_move
      TicTacToe::AI.new(current_player).get_move(board)
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