#https://www.youtube.com/watch?v=eTHFavSQQkY

class TicTacToe
  
  def initialize #initialize set @board = new array that has 9 blank spaces
    @board = Array.new(9, " ")
  end 
  
  #constant in class TicTacToe
  WIN_COMBINATIONS = [ 
    [0,1,2], [0,3,6],[0,4,8],
    [3,4,5],
    [6,7,8], [6,4,2],
    [1,4,7], [2,5,8]
  ] # 8 possible winning solutions
  
  def display_board #board design with @board array locations
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
    
  def input_to_index(number) #user input a number 1-9 into 0-8
    number.to_i - 1
  end   
  
  def move(index, player1 = "X") # two arguments index and a player with a default = X
    @board[index] = player1 
  end   
  
  def position_taken?(index) #check for 0-8 or empty space, .nil?(nil method) returns true if nil (nil.nil? = true) 
    !(@board[index].nil? || @board[index] == " ") #returns true || false
  end   
  
  def valid_move?(index) #number is >0 and <9 (.between?) and not position_taken?
    index.between?(0,9) && !position_taken?(index) #return true || false
  end   
  
  def turn_count #counts X's and O's used  
    turn = 0 #count start at 0
    @board.each do |index| # check each index spot on @board
      if index == "X" || index == "O" # if index ==X or ==O 
        turn += 1 # add 1 to turn
      end
    end   
    turn #return number of turn 
  end   
  
  def current_player # use turn_count (even/odd turn use remainder %) to determine X||O turn
    if turn_count % 2 == 0 # if turn_count/2 has no remainder then X 
      player = "X" 
    else # else O
      player = "O"
    end   
    return player #return which player
  end   
    
  def turn   
    # receives user input via the gets method (FAILED - 1)
    # calls #input_to_index, #valid_move?, and #current_player (FAILED - 2)
    # makes valid moves and displays the board (FAILED - 3)
    # asks for input again after a failed validation (FAILED - 4)
  end  
  
#   def won? #WIN_COMBINATIONS, false/nil = no win, return array if win 
#       returns false for a draw
#       returns the winning combo for a win (FAILED - 5)
#   end   
  
#   def full?
#       returns true for a draw (FAILED - 6)
#       returns false for an in-progress game (FAILED - 7)
#   end
  
#   def draw?
#       returns true for a draw (FAILED - 8)
#       returns false for a won game (FAILED - 9)
#       returns false for an in-progress game (FAILED - 10)
#   end   

#   def over?
#       returns true for a draw (FAILED - 11)
#       returns true for a won game (FAILED - 12)
#       returns false for an in-progress game (FAILED - 13)
#   end

#   def winner
#       return X when X won (FAILED - 14)
#       returns O when O won (FAILED - 15)
#       returns nil when no winner (FAILED - 16)
#   end

end 

# # ./lib/tic_tac_toe.rb
#   TicTacToe
#     #play
#       asks for players input on a turn of the game (FAILED - 17)
#       checks if the game is over after every turn (FAILED - 18)
#       plays the first turn of the game (FAILED - 19)
#       plays the first few turns of the game (FAILED - 20)
#       checks if the game is won after every turn (FAILED - 21)
#       checks if the game is draw after every turn (FAILED - 22)
#       stops playing if someone has won (FAILED - 23)
#       congratulates the winner X (FAILED - 24)
#       congratulates the winner O (FAILED - 25)
#       stops playing in a draw (FAILED - 26)
#       prints "Cat's Game!" on a draw (FAILED - 27)
#       plays through an entire game (FAILED - 28)

# bin/tictactoe
# instantiates an instance of TicTacToe (FAILED - 29)
# calls #play on the instance of TicTacToe (FAILED - 30)  