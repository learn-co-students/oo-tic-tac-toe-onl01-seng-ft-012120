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
    @board.count{|tok| tok == "X" || tok == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(idx)
    idx.to_i - 1
  end

  def move(idx, tok = "X")
    @board[idx] = tok
  end
    
  def position_taken?(idx)
    return@board[idx] == "X" || @board[idx] == "O"
  end

  def valid_move?(idx)
    return @board[idx] == " " && idx.between?(0,8)
  end

  def turn
    idx = ''
    input = ''
    loop do
      puts "Enter position between 1-9: "
      input = gets.chomp.strip
      idx = input_to_index(input)
      break if (valid_move?(idx))
    end
    move(idx, current_player)
    display_board
  end

  def won?
    j = 0
    WIN_COMBINATIONS.each { |combo| return [combo[j],combo[j+1],combo[j+2]] if @board[combo[j]] === @board[combo[j+1]] && @board[combo[j+2]] === @board[combo[j+1]] && @board[combo[j]] != ' ' }
    return false
  end

  def full?
    return !(@board.include?(' '))
  end

  def draw?
    return (full? && !won?)
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
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
