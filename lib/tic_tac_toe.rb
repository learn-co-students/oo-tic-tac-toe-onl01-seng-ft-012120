require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # horizontal combination top
    [3,4,5], # horizontal combination middle
    [6,7,8], # horizontal combination bottom
    [0,3,6], # vertical combination top
    [1,4,7], # vertical combination middle
    [2,5,8], # vertical combination bottom
    [0,4,8], # Diagonal combination
    [2,4,6]  # Diagonal combination
  ]
  def initialize(board = nil)
    @board = board || Array.new(9, ' ')
  end
  def board
    @board
  end
  
  def display_board
    # self.board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
    board = self.board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  def input_to_index(str)
    input = str.to_i - 1
    input
  end

  def move(position, type)
    self.board[position] = type
  end
  def position_taken?(index)
    self.board[index] != " "
  end
  def valid_move?(index)
    # !self.position_taken?(index) && !!self.board[index]
    !position_taken?(index) && index.between?(0,8)
  end
  def turn_count
    self.board.count("X") + self.board.count('O')
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    input = input_to_index(gets.strip)
    if valid_move?(input)
      player = self.current_player
      self.move(input, player)
      self.display_board
    else
      self.turn
    end
  end



  def won?
    WIN_COMBINATIONS.each do |combination|
      x_win = self.board[combination[0]] == 'X' && self.board[combination[1]] == 'X' && self.board[combination[2]] == 'X'
      o_win = self.board[combination[0]] == 'O' && self.board[combination[1]] == 'O' && self.board[combination[2]] == 'O'
      if x_win || o_win
        return combination
      end
    end
    false
  end

  def full?
    !self.board.include?(' ')
  end

  def draw?
    if self.won? || !full?
      return false
    else
      true
    end
  end
  
  def over?
    self.won? || self.draw?
  end
  def winner
   if !!self.won? # return the the previous player who make the winner move.
    return current_player == 'O' ? 'X' : 'O'
   end
  nil
  end

  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
