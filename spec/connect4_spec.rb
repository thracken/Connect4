require_relative "../connect4.rb"

describe Connect4 do
  before :all do
    @game = Connect4.new
    @board = @game.board
    @move = [5,4]
    @game.change_players
  end

  describe "#change_players" do
    it "changes from player 1 to player 2" do
      @game.change_players
      expect(@game.cur_player).to eq(@game.player2)
    end

    it "changes back from player 2 to player 1" do
      @game.change_players
      expect(@game.cur_player).to eq(@game.player1)
    end
  end

  describe "#get_column" do
    it "returns 4 when in debug mode" do
      expect(@game.get_column).to eq(4)
    end
  end

  describe "#place_token"do
    it "places an X token at the bottom of col 4" do
      @game.place_token(4)
      expect(@board.board[5][4]).to eq("X")
    end
    it "places an X token in the second to bottom row of col 4" do
      @game.place_token(4)
      expect(@board.board[4][4]).to eq("X")
    end
  end

  describe "#check_move" do
    it "checks for 4-in-a-row horizontally" do
      game = Connect4.new
      game.place_token(1)
      game.place_token(2)
      game.place_token(3)
      game.place_token(4)
      expect(game.check_move).to eq(true)
    end
    it "returns false when only 3-in-a-row horizontally" do
      game = Connect4.new
      game.place_token(1)
      game.place_token(2)
      game.place_token(3)
      expect(game.check_move).to eq(false)
    end
    it "returns true for 4-in-a-row vertically" do
      game = Connect4.new
      game.place_token(4)
      game.place_token(4)
      game.place_token(4)
      game.place_token(4)
      expect(game.check_move).to eq(true)
    end
  end

  #describe Player do
  #end #Player

  #describe Board do
  #end #Board
end #Connect4
