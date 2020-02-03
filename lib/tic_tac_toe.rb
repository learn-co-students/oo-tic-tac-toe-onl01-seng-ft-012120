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
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def turn
    puts "Select your move (1-9)\n"
    move = gets.chomp
    move_index = input_to_index(move)
    if valid_move?(move_index)
      token = current_player
      move(move_index, token)
      display_board
    else
      puts "Select your move (1-9)\n"
      move = gets.chomp
    end
  end
  
  def won?

     board_empty = @board.none? { |i| i == "X" || i = "O"}
     if board_empty
       false
     else 
       WIN_COMBINATIONS.each do |combo| 
         if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
           return combo
         end
       end
       return false
    end
  end
 
  def full?
    @board.all? { |i| i =="X" || i == "O"}
  end
  
  def draw?
     !won? && full? ? true : false
  end
  
  def over?
     won? || draw? || full? ? true : false
  end
  
  def winner 
     WIN_COMBINATIONS.detect do |combo| 
           if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" 
             return "X"
           elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
             return "O"
           else 
             nil
           end
     end
  end
  
  def play

 		while over? == false
 		turn
 		end

 		if (draw? == true) 
 		puts "Cat's Game!"
 		else puts "Congratulations #{winner}!"
 		end 
 	end
 	
 	# Or play could look like this:
 	# def play
  #   until over?
  #     turn
  #   end

  #   if won? 
  #     puts "Congratulations #{winner}!"
  #   elsif draw?
  #     puts "Cat's Game!"
  #   end
  # end
  
  
end