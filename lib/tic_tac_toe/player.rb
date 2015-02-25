module TicTacToe
  class Player
    attr_reader :mark
    def initialize(mark)
      @mark = mark
    end

    def to_s
      mark
    end
  end
end