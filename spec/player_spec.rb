require "spec_helper"

module TicTacToe
  describe Player do
    let(:player) {Player.new('X')}

    describe "#mark" do
      it "is the mark" do
        expect(player.mark).to eq 'X'
      end
    end

    describe "#to_s" do
      it "should be its mark" do
        expect(player.to_s).to eq "X"
      end
    end
  end
end