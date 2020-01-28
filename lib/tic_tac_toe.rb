class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    string.to_i - 1 
  end 
  
  def move(index, token = "X")
    @board[index] = token
  end 
  
  def position_taken?(index)
    if @board[index] == " "
      false 
    else 
      true 
    end 
  end 
  
  def valid_move?(index)
    if index >= 0 && index <= 8 && !position_taken?(index)
      true 
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
  
  def turn
    puts "Please make a move. [1-9]"
    input = gets 
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      @board[index] = token 
      display_board
    else 
      puts "Invalid move."
      turn 
    end 
  end 
  
  def won?
    @x_moves = []
    @o_moves = []
    @board.each_with_index do |value, i|
      if value == "X"
        @x_moves << i 
      elsif value == "O"
        @o_moves << i 
      end 
    end 
    WIN_COMBINATIONS.detect do |win_array|
      (win_array - @x_moves).empty? || (win_array - @o_moves).empty?
    end 
  end 
  
  def full?
    @board.all? { |i| i == "X" || i == "O" }
  end 
  
  def draw?
    if full? == true &&  !!won? == false 
      true 
    else 
      false 
    end 
  end 
  
  def over?
    if !!won? == true || draw? == true 
      true 
    end 
  end 
  
  def winner
    if won? == nil 
      nil 
    elsif (won? - @x_moves).empty?
      "X"
    elsif (won? - @o_moves). empty?
      "O"
    end 
  end 

  def play 
    until over? do 
      turn 
    end 
    
    if !!won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 

end 





