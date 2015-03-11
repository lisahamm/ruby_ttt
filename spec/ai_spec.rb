require "spec_helper"

module TicTacToe
  describe AI do

    describe "#get_move" do
      it "selects the winning move when able to win" do
        cells = ['O', 'O', nil, 'X', 'X', nil, nil, nil, nil]
        board = Board.new(size: 3, cells: cells)
        ai = AI.new('O')
        expect(ai.get_move(board)).to eq 2
      end

      it "blocks winning move when opponent is able to win" do
        cells = ['X', 'X', nil, nil, 'O', nil, nil, nil, nil]
        board = Board.new(size: 3, cells: cells)
        ai = AI.new('O')
        expect(ai.get_move(board)).to eq 2
      end
    end
  end
end