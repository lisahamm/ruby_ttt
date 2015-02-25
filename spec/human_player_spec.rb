require "spec_helper"

module TicTacToe
  describe HumanPlayer do
    let(:board) {Board.new}
    let(:human_player) {HumanPlayer.new('X')}

    describe "#take_turn" do
      it "places its mark in valid selected cell" do
        human_player.take_turn(board, 0)
        expect(board.get_cell(0)).to eq "X"
      end
    end
  end
end