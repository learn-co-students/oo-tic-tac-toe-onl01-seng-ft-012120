class TicTacToe
  attr_accessor :board, :WIN_COMBINATIONS
  
  WIN_COMBINATIONS = [
    [0, 1, 2], 
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]
  
  def initialize
    @board = Array.new(9, " ")
    
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(str)
    str.to_i - 1 
  end
  
  def move(index, token = 'X')
    @board[index] = token
  end
  
  def position_taken?(index)
    return @board[index] != " "  
  end
  
  def valid_move?(index)
    return (index >= 0 && index <= 8 && !self.position_taken?(index))
  end
  
  def turn 
    puts "Enter number bewteen 1 and 9 "
    user_input = gets
    index = self.input_to_index(user_input)
    
    while !self.valid_move?(index) do
      puts "Enter number bewteen 1 and 9 "
      user_input = gets
      index = self.input_to_index(user_input)
      
    end
    
    self.move(index, self.current_player)
    self.display_board
    
    # if self.valid_move?(index)
    #   self.move(index, self.current_player)
    #   self.display_board
    # else 
    #   self.turn
    # end
  end
  
  def turn_count 
    count = 0 
    @board.each do |token|
      if token != " "
        count += 1 
      end
    end
    return count
  end
  
  def current_player
    self.turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
   WIN_COMBINATIONS.each do |comb|
     if @board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] == "X"
       return comb 
     end
     if @board[comb[0]] == "O" && @board[comb[1]] == "O" && @board[comb[2]] == "O"
       return comb
     end
      
   end
   return false
  end
  
  def full?
    @board.each do |token|
      if token == " "
        return false
      end
    end
    return true
  end
  
  def draw?
   return full? && !won?
 end
 
 def over?
   return self.won? || self.draw? 
 end
 
 def winner
   if !self.over? || self.draw?
     return nil 
   end
   if self.current_player == "X"
     return "O"
   else
     return "X"
   end
 end
   
   def play
     turn until over?
      
      
      
     
     
     if won?
       puts "Congratulations #{winner}!"
     elsif draw?
      puts "Cat's Game!"
     end
     
   end
end

