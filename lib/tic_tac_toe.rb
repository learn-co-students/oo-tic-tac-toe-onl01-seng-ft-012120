require 'pry'
class TicTacToe
  attr_accessor :board, :index
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8], [0,4,8], [2,4,6]]
  
  def initialize
    @board = Array.new(9, ' ')
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    @index = string.to_i - 1
  end 

  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" ||  @board[index] == "O"
  end 
  
  def valid_move?(position)
    0 <= position && position <= 8 && !position_taken?(position)
  end
  
  def turn 
    player = self.current_player
    puts " #{player}, make a move - enter a number 1 through 9"
    input = gets.chomp
    index = self.input_to_index(input)
    if self.valid_move?(index) 
      self.move(index, player)
      self.display_board
    else 
      puts "invalid move"
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each {|position| count += 1 if position == "X" || position == "O"}
    count
  end 
  
  def current_player
    player = nil
    if self.turn_count % 2 == 0 
      player = "X"
    else
      player = "O"
    end
    player
  end 
  
  def won?
    result = false
    @winner = nil
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
        result = combo
        @winner = @board[combo[0]] if @board[combo[0]] != " "
      end
    end
    result
  end
  
  def full?
    result = true
    @board.each do |position|
      result = false if position == " " || position == " "
    end
    result
  end
  
  def draw?
    if full? && won?
      false
    elsif full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    won? || draw? ? true : false
  end
  
  def winner
    self.won?
    @winner
  end
  
  def play
    display_board
    while !over? do
     turn
    end
    if won?
      puts "Congratulations #{@winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end 
end
