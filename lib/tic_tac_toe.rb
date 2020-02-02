class TicTacToe
  WIN_COMBINATIONS = [ 
[0,1,2], # top_row 
[3,4,5], # middle_row 
[6,7,8], # bottom_row 
[0,3,6], # left_column 
[1,4,7], # center_column 
[2,5,8], # right_column 
[0,4,8], # left_diagonal 
[6,4,2] # right_diagonal 
]
  
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
  
  def input_to_index(board_position)
    user_input = board_position.to_i
    user_input - 1
  end
  
  def move(board_index, player_token = 'X')
    @board[board_index] = player_token
  end
  
  def position_taken?(board_position)
    if @board[board_position] == ' '
      false
    else
      true
    end
  end
  
  def valid_move?(board_position)
    if board_position >= 0 and board_position <= 8
      if @board[board_position] == ' '
        true
      end
    else
      false
    end
  end
  
  def turn
    
  end
  
  def turn_count
    
  end
  
  def current_player
    
  end
  
  def won?
    
  end
  
  def full?
    
  end
  
  def draw?
    
  end
  
  def over?
    
  end
  
  def winner
    
  end
  
  def play
    
  end
end