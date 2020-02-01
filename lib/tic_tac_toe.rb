class TicTacToe
  attr_accessor :board

  def initialize
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(str)
    return -1 + str.to_i
  end

  def move(idx, tok)
    @board[idx] = tok
  end

  def position_taken?(idx)
    return @board[idx] === 'X' || @board[idx] === 'O' ? true : false
  end

  def valid_move?(idx)
    return (!position_taken?(idx) && idx.between?(0,8))
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

  def turn_count
    return @board.count('X') + @board.count('O')
  end

  def current_player
    return turn_count % 2 === 0 ? "X" : "O"
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
    if (full? && !(won?.instance_of? Array))
      return true
    elsif (won?.instance_of? Array)
      return false
    elsif (!full? && !(won?.instance_of? Array))
      return false
    end
  end

  def over?
    return (draw? || (won?.instance_of? Array))
    return false
  end

  def winner
    return @board[won?[0]] if won?.instance_of? Array
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
end

