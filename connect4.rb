class Connect4
  DEBUG = true
  attr_accessor :board

  def col_debugger
    DEBUG == true ? 4 : nil
  end
  
  def initialize
    @board = Board.new
    @player1 = Player.new
    @player1.token = "X"
    @player2 = Player.new
    @player2.token = "O"
    @cur_player = @player1
  end #initialize

  def change_players
    @cur_player == @player1 ? @player2 : @player1
  end #change_players

  def play
    until game_over?
      @board.show
      place_token(get_column)
      change_players
    end
  end #play

  def get_column(col = col_debugger)
    puts "Which column do you want to play on? (0-6)"
    loop do
      col ||= gets.chomp.to_i
      if col < 7 && col >= 0 && @board.board[0][col] == " "
        break
      else
        puts "Try again - enter a column number from 0 to 6."
        col = nil
      end
    end
    return col
  end #get_column

  def place_token(col = col_debugger)
    5.downto(0) do |row|
      if @board.board[row][col] = " "
        @board.board[row][col] = @cur_player.token
        break
      end
    end
  end #place_token

  def game_over?
  end #game_over?

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
      6.times do |x|
        7.times do |y|
          print "|#{@board[x][y]}"
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
