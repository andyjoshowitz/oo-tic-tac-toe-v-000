class TicTacToe
  
  def initialize(board = nil)
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
  
  def input_to_index(user_input)
    user_input.to_i - 1 
  end
  
  def move(index, character="X")
    @board[index]=character 
  end 
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if !valid_move?(index)
      puts "Invalid entry."
      turn
    end
    move(index, current_player)
    display_board
  end
  
  def turn_count
    turn = 0
    @board.each do |index| 
      turn += 1 if index == 'X' || index == 'O'
    end
    
    turn
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      position_1 = @board[win_combo[0]]
      position_2 = @board[win_combo[1]]
      position_3 = @board[win_combo[2]]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
  end
  
  def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
    full? == true && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      winner = @board[won?[0]]
    end
  end
  
  def play
    until over?
      turn
    end
    if draw?
         puts "Cat's Game!"
    elsif won?
       puts "Congratulations #{winner}!"
     end
  end

end
 
