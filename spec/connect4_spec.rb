require_relative "../connect4.rb"

describe Connect4 do
  before :all do
    @game = Connect4.new
    @board = @game.board
  end

  describe "#get_column" do
    it "returns 4 by default" do
      expect(@game.get_column).to eq(4)
    end
  end

  describe "#place_token"do
    it "place an X token at the bottom of col 4" do
      @game.place_token(4)
      expect(@board.board[5][4]).to eq("X")
    end
  end

  #describe Player do
  #end #Player

  #describe Board do
  #end #Board
end #Connect4
