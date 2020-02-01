class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 4 ,6],
    [2, 5, 8]
    ]
    
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(index)
    index.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end
    
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if @board[index] == " " && index > -1 && index < 9
      return true
    else
      return false
    end
  end

  def turn
    puts "Enter your selection (Number 1-9):"
    index = gets.chomp.to_i
    index_new = input_to_index(index)
    token = current_player
    if valid_move?(index_new) == true
      move(index_new, token)
      display_board
    else
      turn
    end
  end

  def won?
    j = 0
    WIN_COMBINATIONS.each { |combo| return [combo[j],combo[j+1],combo[j+2]] if @board[combo[j]] === @board[combo[j+1]] && @board[combo[j+2]] === @board[combo[j+1]] && @board[combo[j]] != ' ' }
    return false
  end

  def full?
    if @board.any? { |x| x == " "}
      return false
    else
      true
    end
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won?  || draw? 
      return true
    else
      return false
    end
  end

  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      return nil
    end
  end

def play
  
loop do
  turn
    break if over? === true
  end
  if draw?
    puts "Cat's Game!"
  else
    puts "Congratulations, #{winner}!"
end

    

end
