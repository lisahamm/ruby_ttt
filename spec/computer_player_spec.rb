require "spec_helper"

module TicTacToe
  describe ComputerPlayer do
    let(:computer_player) {ComputerPlayer.new('O')}

    describe "#take_turn" do
      it "makes the winning move when able to win" do
        cells = ['O', 'O', nil, 'X', 'X', nil, nil, nil, nil]
        board = Board.new(size: 3, cells: cells)
        computer_player.take_turn(board)
        expect(board.get_cell(2)).to eq 'O'
      end

      it "blocks winning move when opponent is able to win" do
        cells = ['X', 'X', nil, nil, 'O', nil, nil, nil, nil]
        board = Board.new(size: 3, cells: cells)
        computer_player.take_turn(board)
        expect(board.get_cell(2)).to eq 'O'
      end
    end
  end
end