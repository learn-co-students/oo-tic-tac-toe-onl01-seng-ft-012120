class TicTacToe
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8], #horizontal

        [0,3,6],
        [1,4,7],
        [2,5,8], #vertical

        [0,4,8],
        [2,4,6] #diagonal
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

    def input_to_index(string)
        input = string.to_i
        input -= 1
    end

    def move(position, piece)
        @board[position] = piece
    end

    def position_taken?(position)
        if @board[position] == " "
            false
        else
            true
        end
    end

    def valid_move?(position)
        valid_moves = (0..8).to_a
        if self.position_taken?(position)
            false
        elsif !valid_moves.include?(position)
            false
        else
            true
        end
    end

    def turn_count
        count = 0
        @board.count {|piece| piece != " "}
    end

    def current_player
        if self.turn_count % 2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Please enter 1-9:"
        input = gets.chomp #gets input
        index = self.input_to_index(input)  #input to index
        current_player = self.current_player #finds current player
        
        if self.valid_move?(index)
            self.move(index, current_player)
        else
            self.turn
        end

        self.display_board
    end

    def won?
    
        winner = WIN_COMBINATIONS.select do |winning_combo|
            winning_combo.all? { |winning_idx| @board[winning_idx.to_i] == "X"} || winning_combo.all? { |winning_idx| @board[winning_idx.to_i] == "O"}
        end
        
        if winner == []
            nil
        else
            winner.flatten
        end


    end

    def full?
        if @board.include?(" ") 
            false #false if there is an empty space
        else
            !self.won? #true if the game has not been won
        end
    end

    def draw?
        if self.won?
            false
        elsif self.full?
            true
        end
    end

    def over?
        (self.draw? || self.won?) || false
    end

    def winner
        if !self.won?
            nil
        else
            self.champion_player
        end

    end
    
    def champion_player #because the champion player has already completed their turn
        if self.turn_count % 2 == 0
            "O"
        else
            "X"
        end
    end

    def play
        until self.over?
            self.turn
        end

        if self.won?
            puts "Congratulations #{champion_player}!"
        else
            puts "Cat's Game!"
        end
    end

end