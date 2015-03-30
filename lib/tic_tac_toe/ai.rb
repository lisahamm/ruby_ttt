module TicTacToe
  class AI

    def initialize(mark)
      @mark = mark
    end

    def get_move(board)
      if board.empty?
        (0..8).to_a.sample
      else
        minimax(board, mark, Rules.new(board))
      end
    end

    private
    attr_reader :mark

    def opponent(player)
      player == 'X' ? 'O' : 'X'
    end

    def score(board, rules, depth)
      if rules.get_winning_mark == mark
        10 - depth
      elsif rules.get_winning_mark == opponent(mark)
        depth - 10
      else
        0
      end
    end

    def minimax(board, player, rules, depth = 0)
      return score(board, rules, depth) if rules.over?
      scores = []
      moves = []
      opponent = opponent(player)

      board.empty_cells.each do |cell_number|
        board.set_cell(cell_number, player)
        scores.push minimax(board, opponent, Rules.new(board), depth + 1)
        board.remove_mark(cell_number)
        moves.push cell_number
      end

      if depth.zero?
        get_max_score_and_move(scores, moves)[:move]
      elsif player == mark
        get_max_score_and_move(scores, moves)[:score]
      else
        get_min_score_and_move(scores, moves)[:score]
      end
    end

    def get_max_score_and_move(scores, moves)
      max_score_index = scores.each_with_index.max[1]
      {score: scores[max_score_index], move: moves[max_score_index]}
    end

    def get_min_score_and_move(scores, moves)
      min_score_index = scores.each_with_index.min[1]
      {score: scores[min_score_index], move: moves[min_score_index]}
    end
  end
end