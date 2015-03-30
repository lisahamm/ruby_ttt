require "spec_helper"

module TicTacToe
  describe Rules do
    let(:board) {Board.new}

    let(:won_board) do
      cells = ['X', 'X', 'O',
               'O', 'X', 'X',
               'X', 'O', 'X']
      Board.new(cells: cells)
    end

    let(:tie_board) do
      cells = ['X', 'X', 'O',
               'O', 'O', 'X',
               'X', 'O', 'X']
      Board.new(cells: cells)
    end

    describe "valid_cell_number?" do
      before :each do
        @rules = Rules.new(board)
      end

      it "is true when cell number is within the board's cell range" do
        expect(@rules.valid_cell_number?(0)).to eq true
      end

      it "is false when cell number is outside the board's cell range" do
        expect(@rules.valid_cell_number?(9)).to eq false
      end
    end

    describe "#tie_game?" do
      it "is true when tied" do
        expect(Rules.new(tie_board).tie_game?).to eq true
      end

      it "is false when won" do
        expect(Rules.new(won_board).tie_game?).to eq false
      end

      it "is false when all cells are empty" do
        expect(Rules.new(board).tie_game?).to eq false
      end
    end

    describe "#over?" do
      it "is true when tied" do
        expect(Rules.new(tie_board).over?).to eq true
      end

      it "is true when won" do
        expect(Rules.new(won_board).over?).to eq true
      end

      it "is false when all cells are empty" do
        expect(Rules.new(board).over?).to eq false
      end
    end

    describe "#get_winning_mark" do
      it "returns the winner's mark when won" do
        expect(Rules.new(won_board).get_winning_mark).to eq 'X'
      end

      it "is nil when there is no winner" do
        expect(Rules.new(board).get_winning_mark).to eq nil
      end
    end

    describe "#winner?" do
      it "is true when won" do
        expect(Rules.new(won_board).winner?).to eq true
      end

      it "is false when tied" do
        expect(Rules.new(tie_board).winner?).to eq false
      end

      it "is false when all cells are empty" do
        expect(Rules.new(board).winner?).to eq false
      end
    end
  end
end