module TicTacToe
  class Player
    attr_reader :mark, :ai

    def initialize(mark, ai)
      @mark = mark
      @ai = ai
    end

    def to_s
      mark
    end
  end
end