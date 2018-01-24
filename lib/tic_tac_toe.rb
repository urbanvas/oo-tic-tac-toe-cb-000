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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(input_to_index, movement = "X")
    @board[input_to_index] = movement
  end

  def position_taken?(location)
     @board[location] != " " && @board[location] != ""
   end

   def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
   end

   def turn_count
     @board.count do |hoe|
       hoe == "X" || hoe == "O"
     end
   end

   def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Pick 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def xwin(array)
    array.all? { |d| d == "X"}
  end

  def owin(array)
    array.all? { |d| d == "O"}
  end

    def won?
      WIN_COMBINATIONS.each do |i|
        result = []
        i.each do |j|
          result << @board[j]
        end
        if owin(result)
          return i
        elsif xwin(result)
          return i
        end
        end
      return false
    end

  def full?
    @board.none? do |f|
      f == " "
    end
  end

  # def draw?
  #   !@board.all? == " " || won? == false
  # end
  def draw?
  a = 0
  b = 0
  if full?
    a += 1
  end
  if won?
    b +=1
    return false
  end
  if a == 1 && b = 0
      return true
  end
    return false
end

    def over?
      draw? || won? || full?
    end

    def winner
  WIN_COMBINATIONS.each do |i|
    result = []
    i.each do |j|
      result << @board[j]
    end
    if owin(result)
      return "O"
    elsif xwin(result)
      return "X"
    end
    end
  return nil
end

def play
  until over?
    turn
  end
  if winner
    c = winner
    puts "Congratulations #{c}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
