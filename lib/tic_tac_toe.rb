
class TicTacToe


WIN_COMBINATIONS = [
                      [0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]
                                  ]
        def initialize
          @board=[" ", " ", " ", " ", " ", " ", " ", " ", " "]
        end

        def display_board

          puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
          puts "-----------"
          puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
          puts "-----------"
          puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
          puts "-----------"
        end

        def input_to_index(input)
          i = input.to_i - 1
          i
        end

        def move(number, token = "X")
          @board[number] = token
        end

        def position_taken?(i)
            if @board[i] == "X"
              true
            elsif @board[i] == "O"
              true
            else
              false
            end
        end

        def valid_move?(i)
          i = i.to_i
          if i.between?(0,8) && !position_taken?(i)
            true
          else
            false
          end
        end

        def turn_count
          count = 0

          @board.each do|i|
              if i == "X"
                count += 1
              elsif i == "O"
                 count += 1
              end
            end
            count
        end

        def current_player

            if turn_count % 2 == 0
              "X"
            else
              "O"
            end
        end

        def turn

          puts "Enter a number between 1-9"
          user_input = gets.chomp
          index = input_to_index(user_input)
          token = current_player

          if valid_move?(index)
            move(index,token) && display_board
          elsif valid_move?(index) == false
            turn
          end
        end

        def won?
          WIN_COMBINATIONS.find do |i|
            index_0 = i[0]
            index_1 = i[1]
            index_2 = i[2]

            if @board[index_0] == "X" && @board[index_1] == "X" && @board[index_2] == "X"
              return i
            elsif @board[index_0] == "O" && @board[index_1] == "O" && @board[index_2] == "O"
              return i
            else
              false
            end
          end
        end

        def full?
          @board.all? {|i| i == "X" || i == "O"}
        end

        def draw?
          if !won? && full?
            true
          end
        end

        def over?
          if draw? || won?
            true
          else
            false
          end
        end

        def winner
          WIN_COMBINATIONS.find do |i|
            index_0 = i[0]
            index_1 = i[1]
            index_2 = i[2]

            if @board[index_0] == "X" && @board[index_1] == "X" && @board[index_2] == "X"
              return "X"
            elsif @board[index_0] == "O" && @board[index_1] == "O" && @board[index_2] == "O"
              return "O"
            else
              nil
            end
          end
        end

        def play
          until over?
            turn
          end
          if winner == "X"
            puts "Congratulations X!"
          elsif winner == "O"
            puts "Congratulations O!"
          elsif draw?
            puts "Cat's Game!"
          end
        end
end
