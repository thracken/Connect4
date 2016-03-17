class Connect4
  DEBUG = true

  if DEBUG
    attr_accessor :board, :player1, :player2, :cur_player, :cur_move
    def col_debugger
      DEBUG == true ? 4 : nil
    end
    def move_check_debug
      DEBUG == true ? [5,4] : nil
    end
  end

  def initialize
    @board = Board.new
    @player1 = Player.new
    @player1.token = "X"
    @player2 = Player.new
    @player2.token = "O"
    @cur_player = @player2
    @cur_move = nil
  end #initialize

  def change_players
    @cur_player == @player1 ? @cur_player = @player2 : @cur_player = @player1
  end #change_players

  def play
    until game_over?
      change_players
      @board.show
      x = get_column
      place_token(x)
    end
  end #play

  def get_column(col = col_debugger)
    puts "Which column do you want to play on? (0-6)"
    loop do
      col ||= gets.chomp.to_i
      if col < 7 && col >= 0 && @board.board[0][col] == " "
        break
      elsif @board.board[0][col] != " "
        puts "That column is full - please pick a different one."
      else
        puts "Try again - enter a column number from 0 to 6."
        col = nil
      end
    end
    return col
  end #get_column

  def place_token(col = col_debugger)
    5.downto(0) do |row|
      if @board.board[row][col] == " "
        @board.board[row][col] = @cur_player.token
        @cur_move = [row,col]
        break
      end
    end
  end #place_token

  def game_over?
    check_move(@cur_move) ? true : false
  end #game_over?

  def check_move(move = move_check_debug)
    row, col = move[0], move[1]
    if check_horizontal(row,col)
      return true
    elsif check_vertical(row,col)
      return true
    elsif check_diag1(row,col)
      return true
    elsif check_diag2(row,col)
      return true
    else
      return false
    end
    #check horizontally for win
    #check vertically for win
    #check diagnolly \ for win
    #check other diagonal / for win
  end #check_move

  def check_horizontal(row,col)
    if col > 2
      return true if @board.board[row][col-3..col].all? {|val| val == @cur_player.token}
    elsif col > 1 && col < 6
      return true if @board.board[row][col-2..col+1].all? {|val| val == @cur_player.token}
    elsif col > 0 && col < 5
      return true if @board.board[row][col-1..col+2].all? {|val| val == @cur_player.token}
    elsif col < 4
      return true if @board.board[row][col..col+3].all? {|val| val == @cur_player.token}
    else
      return nil
    end
  end #check_horizontal

  def check_vertical(row,col)
    if row > 2
      return true if [@board.board[row-3][col], @board.board[row-2][col], @board.board[row-1][col], @board.board[row][col]].all? {|val| val == @cur_player.token}
    elsif row > 1 && row < 5
      return true if [@board.board[row-2][col], @board.board[row-1][col], @board.board[row][col], @board.board[row+1][col]].all? {|val| val == @cur_player.token}
    elsif row > 0 && row < 4
      return true if [@board.board[row-1][col], @board.board[row][col], @board.board[row+1][col], @board.board[row+2][col]].all? {|val| val == @cur_player.token}
    elsif row < 3
      return true if [@board.board[row][col], @board.board[row+1][col], @board.board[row+2][col], @board.board[row+3][col]].all? {|val| val == @cur_player.token}
    else
      return nil
    end
  end #check_vertical

  def check_diag1(row,col)
    nil
  end

  def check_diag2(row,col)
    nil
  end

  class Board
    DEBUG = true
    attr_accessor :board
    def initialize
      @board = Array.new(6) do
        Array.new(7, " ")
      end
    end

    def show
      puts
      puts " 0 1 2 3 4 5 6 "
      6.times do |row|
        7.times do |col|
          print "|#{@board[row][col]}"
        end
        puts "|"
        puts "+-+-+-+-+-+-+-+"
      end
      puts
      return
    end #show
  end #Board

  class Player
    DEBUG = true
    attr_accessor :name, :token
    @@count = 1
    def initialize
      puts "Player #{@@count}: What is your name?"
      DEBUG == true ? @name = "Jeff #{@@count}" : @name = gets.chomp
      @num = @@count
      @@count +=1
    end
  end #Player
end #Connect4
