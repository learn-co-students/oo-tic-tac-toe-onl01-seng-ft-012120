require "pry"
class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                       [6,7,8],
                       [0,3,6],
                       [1,4,7] ,
                       [2,5,8],
                        [0,4,8],
                         [6,4,2]]
  def initialize()
    
     @board = Array.new(9," ")
     
     
    
  end  
  
  def display_board
    
        
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    
    (user_input.to_i) -1
  end
  
 def move(index, player_token)
   
   @board[index] = player_token
   
 end
 def position_taken?(index)
   
   if(@board[index]== " ")||(@board[index]== "") || (@board[index]== nil)
     
     return false
     
  else
    
    return true
  end
 end
 def valid_move?(index)
   
   if index.between?(0,8) && !(position_taken?(index))
       return true
       
   else
     
     false
     end
   
 end
 
 def turn_count
 
 @board.count{|token| token == "X" || token == "O"}
    
 end
 
 def current_player
   
   turn_count % 2 == 0 ? "X" : "O"
   
 end
 
 def turn ()
   puts"Enter your move between 1-9"
   
   user_input = gets.strip
   
   index = input_to_index(user_input)
   
   if valid_move?(index)
     
   player_token = current_player
   
   move(index,player_token)
   
    display_board
    
   else  
     
     turn
     
    end   
 end
 
 def won?
   
  # WIN_COMBINATIONS.each {|win_comb|
   
      # index_0 = win_comb[0]
      # index_1 = win_comb[1]
      # index_2 = win_comb[2]
       
      # posi_1 = @board[0]
      # posi_2 = @board[1]
      # posi_3 = @board[2]
       
       
     #  if posi_1 == "X" && posi_2 =="X" && posi_3 =="X"
      #   return win_comb
         
      # elsif posi_1 == "O" && posi_2 =="O" && posi_3 =="O"
     #  return win_comb
    # end
 #  }
   #  return false
   # end
    WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end


def full?
 # @board.each do |index|
   # if index == "X" || index=="O"
      
    #  return true
      
   # else
      
    #  return "falsy value"
    @board.all? {|index| index == "X" || index == "O"}
   # end
 # end  
end


def draw?
  if !won? && full?
    return true
    
  else
    return  false
    
  end
end

def over?
  
  if won? || draw?
    return true
    
  end  
  return false
end

def winner

   WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
      
 end   

end
end

def play
  
 while  over? == false
 #binding.pry
  turn
 
  end 
   
 
 if won?
   puts"Congratulations #{winner}!"
   
  elsif draw?
  
  puts"Cat's Game!"
  
end 
end
end


