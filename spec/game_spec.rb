require "spec_helper"

module TicTacToe
  describe Game do
    let(:player_settings1) {[{mark: 'X', ai: false}, {mark: 'O', ai: true}]}
    let(:player_settings2) {[{mark: 'X', ai: true}, {mark: 'O', ai: false}]}
    let(:player_settings3) {[{mark: 'X', ai: false}, {mark: 'O', ai: false}]}
    let(:game) {Game.new(player_settings1)}


    let(:game_in_play) do
      cells = ['O', 'O', nil,
               nil, 'X', nil,
               nil, nil, nil]
      board = Board.new(cells: cells)
      Game.new(board, player_settings3)
    end

    let(:won_game) do
      cells = ['X', 'X', 'O',
               'O', 'X', 'X',
               'X', 'O', 'X']
      board = Board.new(cells: cells)
      Game.new(board, player_settings3)
    end

    let(:tie_game) do
      cells = ['X', 'X', 'O',
               'O', 'O', 'X',
               'X', 'O', 'X']
      board = Board.new(cells: cells)
      Game.new(board, player_settings3)
    end

    describe "#take_turn" do
      it "adds the current player's mark to specified cell" do
        game.take_turn(0)
        expect(game.board.get_cell(0)).to eq game.current_player.mark
      end

      it "adds an ai move to the board when computer opponent is the first player" do
        game2 = Game.new(player_settings2)
        expect(game2.board.empty?).to eq false
      end
    end

    describe "#switch_turn" do
      it "changes the current player from player1 to player2" do
        game.switch_turn
        expect(game.current_player).to eq game.player2
      end
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
        expect(won_game.get_winning_player.mark).to eq 'X'
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