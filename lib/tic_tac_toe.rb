class TicTacToe
 
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(index)
    if index >= 0 && index <= 8 && position_taken?(index) == false
      true
    else
      false
    end
  end
 
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    token = current_player
    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    @board.count {|index| index == "X" || index == "O"}
  end
  
  def current_player
    if turn_count.odd?
      "O"
    else
      "X"
    end
  end
  
  def won?
    WIN_COMBINATIONS.find {|array| @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X" || @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"}
  end
  
  def full?
    if @board.all? {|index| index == "X" || index == "O"}
      true
    else 
      false
    end
  end
  
  def draw?
    if full? == true && won? == nil
      true
    elsif won? == true
      false
    else
      false
    end
  end
  
  def over?
    if won? || draw?
      true
    end
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end