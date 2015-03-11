module TicTacToe
  class Game
    attr_accessor :board, :current_player_mark
    attr_reader :player1, :player2

    def initialize(board=nil, player_settings, current_player_mark)
      @board = board ||= Board.new
      @player1 = Player.new(player_settings[0])
      @player2 = Player.new(player_settings[1])
      @current_player_mark = current_player_mark
    end

    def board_to_array
      board.to_array
    end

    def take_turn(cell_number)
      board.set_cell(cell_number, current_player_mark)
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