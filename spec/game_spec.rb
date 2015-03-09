require "spec_helper"

module TicTacToe
  describe Game do
    let(:player1) {Player.new('X')}
    let(:player2) {Player.new('O')}

    let(:game) {Game.new(Board.new, player1, player2)}

    let(:game_in_play) do
      cells = ['O', 'O', nil,
               nil, 'X', nil,
               nil, nil, nil]
      board = Board.new(cells: cells)
      Game.new(board, player1, player2)
    end

    let(:won_game) do
      cells = ['X', 'X', 'O',
               'O', 'X', 'X',
               'X', 'O', 'X']
      board = Board.new(cells: cells)
      Game.new(board, player1, player2)
    end

    let(:tie_game) do
      cells = ['X', 'X', 'O',
               'O', 'O', 'X',
               'X', 'O', 'X']
      board = Board.new(cells: cells)
      Game.new(board, player1, player2)
    end

    describe "#in_progress?" do
      it "is true when in play" do
        expect(game_in_play.in_progress?).to eq true
      end

      it "is false when won" do
        expect(won_game.in_progress?).to eq false
      end

      it "is false when tied" do
        expect(tie_game.in_progress?).to eq false
      end
    end

    describe "#winner?" do
      it "is false when in play" do
        expect(game_in_play.winner?).to eq false
      end

      it "is true when won" do
        expect(won_game.winner?).to eq true
      end

      it "is false when tied" do
        expect(tie_game.winner?).to eq false
      end
    end

    describe "#get_winning_player" do
      it "is winner's mark when won" do
        expect(won_game.get_winning_player).to eq player1
      end

      it "is nil when tied" do
        expect(tie_game.get_winning_player).to eq nil
      end

      it "is nil when in play" do
        expect(game_in_play.get_winning_player).to eq nil
      end
    end

    describe "#tie?" do
      it "is false when in play" do
        expect(game_in_play.tie?).to eq false
      end

      it "is true when tied" do
        expect(tie_game.tie?).to eq true
      end

      it "is false when won" do
        expect(won_game.tie?).to eq false
      end
    end
  end
end