class TicTacToe

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
      end

      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
          end
    
      def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end
    
      WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  ]

  def input_to_index(userinput)
    userinput.to_i - 1
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
        true
    else
        false
    end
end

def move(index, token = "X")
    @board[index] = token
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index) == true
      character = current_player
      move(index, character)
      display_board
    else
      turn
    end
  end

def valid_move?(index)
    if position_taken?(index) || index < 0 || index > 8
        false
    else
        true
    end
end


    def turn_count
     @board.count{|token| token == "X" || token == "O"}
    end
    
    def full?
        @board.all?{|space| space == "X" || space == "O"}
    
    end

    def won?
        WIN_COMBINATIONS.each {|combination|
        
        index_1 = combination[0]
        index_2 = combination[1]
        index_3 = combination[2]
       
        position_1 = @board[index_1]
        position_2 = @board[index_2]
        position_3 = @board[index_3]
       

        
        if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 =="O" && position_3 =="O"
            return combination
            
        end
    }
    false
        
    end
        

        def draw?
            if full? == true && won? == false
                true
            else 
                false
            end
        end

        def over?
            if won? || draw?
                true
            else
                false
            end
        end

        def winner
            if won? == false
                nil
            elsif @board[won?[0]] == "O"
                "O"
            elsif @board[won?[0]] == "X"
                "X"
            end
        end

        def play
            while over? ==false
                turn
            end
          
            if won?
                puts "Congratulations #{winner}!"
            elsif draw?
                puts "Cat's Game!"
            
            end
        end
end 