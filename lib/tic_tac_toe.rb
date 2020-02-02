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
    
  def input_to_index(number) #user input number to an integer (.to_i)
    number.to_i - 1
  end   
  
  def move(index, player1 = "X") # two arguments index and a player with a default = X
    @board[index] = player1 
  end   
  
  def position_taken?(index) #check for 0-8 or empty space, .nil?(nil method) returns true if nil (nil.nil? = true) 
    !(@board[index].nil? || @board[index] == " ") #returns true || false
  end   
  
  def valid_move?(index) #coverted input number is 0-8 (.between?) and not position_taken?
    index.between?(0,8) && !position_taken?(index) #return true || false
  end   
  
  def turn_count #counts X's and O's used  
    turn = 0 #count start at 0
    @board.each do |spot| # check each spot on @board
      if spot == "X" || spot == "O" # if spot has an X or O 
        turn += 1 # add 1 to turn
      end
    end   
    turn #return number of turns  
  end   
  
  def current_player # use turn_count (even/odd turn use remainder %) to determine X||O turn
    if turn_count % 2 == 0 # if turn_count/2 has no remainder then X 
      player = "X" 
    else # otherwise O
      player = "O"
    end   
    return player #return which player
  end   
    
  def turn   
    puts "Specify a postion between 1-9: " # ask for a number 1-9
    user_input = gets.chomp # receives user input via the gets.strip/.chomp
    index = input_to_index(user_input) # calls #input_to_index
    if valid_move?(index) #if valid_move? for index  
       player_turn = current_player # current_player's turn
       move(index, player_turn) # makes a valid move
      display_board # displays the board
    else
      turn # asks for input again after a failed validation 
    end 
  end  
  
  def won? #WIN_COMBINATIONS
    WIN_COMBINATIONS.each {|you_win|  # WIN_COMBINATIONS check each winning combo in the array by location   
      win0 = you_win[0]
      win1 = you_win[1]
      win2 = you_win[2]
      
      location1 = @board[win0]
      location2 = @board[win1]
      location3 = @board[win2]
      
      if location1 == "X" && location2 == "X" && location3 == "X"
        return you_win # returns the winning combo array for a win 
      elsif location1 == "O" && location2 == "O" && location3 == "O"
        return you_win # returns the winning combo array for a win 
      end
    }  
    return false # return false/nil if no win
    
    # WIN_COMBINATIONS.find do |you_win|
    #   position_taken?(@board, you_win[0]) && 
    #                   @board[you_win[0]] == @board[you_win[1]] &&
    #                   @board[you_win[0]] == @board[you_win[2]]
    # end
  end   
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}    
    # if @board.include?(" ") # if @board has open spaces (.includes?) 
    #   return false # return false for an in-progress game 
    # else 
    #   return true # returns true for a draw
    # end   
    
    # @board.all? do |index|
    #   indes != " "
    # end 
  end
  
  def draw?
    # full?(@board)
    # !(won?(@board))
    
    if full? && !won? # returns true for a draw? and return true for !won?
      return true 
    else 
      return false # returns false for an in-progress game 
    end   
  end   

  def over?
    if draw? || won? # returns true for a draw? or returns true for won? game 
      return true
    else   
      return false # returns false for an in-progress game 
    end
  end

  def winner
    # if won?(@board)
    #   return @board[won?(@board)[0]]  
    # end   
    
    winner = [] # winner open 
    winner = won? #did winner win  
      if winner == false # returns nil when no winner 
        return nil
      else 
        if @board[winner[0]] == "X" # return X when X won 
          return "X"
        else 
          return "O" # returns O when O won 
        end
      end 
  end

  def play
    # asks for players input on a turn of the game 
    # checks if the game is over after every turn 
    # plays the first turn of the game 
    # plays the first few turns of the game 
    # checks if the game is won after every turn 
    # checks if the game is draw after every turn 
    # stops playing if someone has won 
    # congratulates the winner X 
    # congratulates the winner O 
    # stops playing in a draw 
    # prints "Cat's Game!" on a draw 
    # plays through an entire game 
  end
  
end 
# bin/tictactoe
# instantiates an instance of TicTacToe 
# calls #play on the instance of TicTacToe   