require "spec_helper"

module TicTacToe
  describe Game do
    let(:game) {Game.new({player_marks: ['X', 'O'],
                          current_player_mark: 'X',
                          ai_mark: nil})}

    let(:game_in_play) do
      cells = ['O', 'O', nil,
               nil, 'X', nil,
               nil, nil, nil]
      Game.new({player_marks: ['X', 'O'],
                current_player_mark: 'X',
                ai_mark: nil,
                board: Board.new(cells: cells)})
    end

    let(:won_game) do
      cells = ['X', 'X', 'O',
               'O', 'X', 'X',
               'X', 'O', 'X']
      Game.new({player_marks: ['X', 'O'],
                current_player_mark: 'X',
                ai_mark: nil,
                board: Board.new(cells: cells)})
    end

    let(:tie_game) do
      cells = ['X', 'X', 'O',
               'O', 'O', 'X',
               'X', 'O', 'X']
      Game.new({player_marks: ['X', 'O'],
                current_player_mark: 'X',
                ai_mark: nil,
                board: Board.new(cells: cells)})
    end

    describe "#board_to_array" do
      it "creates an array of the board's cell symbols" do
        cell_values = game_in_play.board_to_array
        expect(cell_values.length).to eq 9
        expect(cell_values.first).to eq 'O'
      end
    end

    describe "#take_turn" do
      context "when cell number is valid" do
        it "adds the current player's mark to specified cell" do
          expect(game.board.get_cell(0)).to eq nil
          player_mark = game.current_player_mark
          game.take_turn(0)
          expect(game.board.get_cell(0)).to eq player_mark
        end

        it "returns true" do
          expect(game.take_turn(0)).to eq true
        end
      end

      context "when cell number is invalid" do
        it "is false if cell number is out of range" do
          expect(game.take_turn(9)).to eq false
        end

        it "is false if the cell has already been marked" do
          expect(game_in_play.take_turn(0)).to eq false
        end
      end
    end

    describe "#generate_ai_move" do
      it "supplies a valid cell number" do
        move = game.generate_ai_move
        expect(move >= 0 && move <= 8).to eq true
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

    describe "#over?" do
      it "is false when in play" do
        expect(game_in_play.over?).to eq false
      end

      it "is true when won" do
        expect(won_game.over?).to eq true
      end

      it "is true when tied" do
        expect(tie_game.over?).to eq true
      end
    end

    describe "#get_winning_player" do
      it "is winner's mark when won" do
        expect(won_game.get_winning_player).to eq 'X'
      end

      it "is nil when tied" do
        expect(tie_game.get_winning_player).to eq nil
      end

      it "is nil when in play" do
        expect(game_in_play.get_winning_player).to eq nil
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