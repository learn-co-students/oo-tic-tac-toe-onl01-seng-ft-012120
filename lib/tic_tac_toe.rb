require 'pry'
class TicTacToe

    attr_accessor :board, :token

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 4, 8],
        [2, 4, 6], 
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]   
    ]

    def initialize 
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
      end

    def input_to_index(user_input)
        user_input.to_i - 1 
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] == " " || @board[index] == "" || @board[index] == nil
          return false
        elsif @board[index] == "X" || @board[index] == "O"
          return true
        end
    end

    def valid_move?(index)
        if index.between?(0, 8) && !position_taken?(index)
          return true 
        end
    end

    def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        input = input_to_index(user_input)
        if !valid_move?(input) 
            puts "Please enter 1-9:"
            user_input = gets.strip
            input = input_to_index(user_input)
        else 
                move(input, current_player)
                display_board
        end
    end

    def turn_count
        num_turns = 0 
        @board.each do |i|
            if i == "X" || i == "O"
                num_turns += 1 
            end
        end
        num_turns
    end

    def current_player
        self.turn_count % 2 == 0 ? @token = "X" : @token = "O"
        @token
    end

    def won?
        #if self.full? 
            WIN_COMBINATIONS.each do |win_array|
                winner_array_board = []
                 win_array.each do |each_win_array_value|
                    winner_array_board<< @board[each_win_array_value] 
                    end
                if winner_array_board.all?("X") || winner_array_board.all?("O")
                    return win_array
                end
                end
                #false
        #end
        false
    end
                    
                # if win_array[0] == i.index && win_array[1] == i.index && win_array[2] == i.index && 
                # win_array.each do |single_win_index|
                #     self.each do |i|
                #         if i.index == single_win_index
                    

            # @board.each do |i|
            #     WIN_COMBINATIONS.each do |j| 
            #         i.each do |board_|
            #         if i.index == j 
            #              {|j| (j == "X" || j == "O")}
            # puts "i si #{i} and j is #{j}"
            #     return i
    #         end
    #     end
    # end

    def full?
        @board.none?(" ")
    end

    def draw?
        self.full? && !self.won? ? true : false
    end


    def over?
        self.full? || self.won? || self.draw? ? true : false
    end

    def winner
        if won?
            #return won?
            win_array = won?
            index_of_winning_array = win_array[0]
            return @board[index_of_winning_array]
        end
    end

    def play 
        while !over? 
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    #end
       
    end

    

end
