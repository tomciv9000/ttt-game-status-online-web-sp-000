# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  # top row 
  [3,4,5],
  # middle row
  [6,7,8],
  # bottom row
  [0,3,6],
  # left column
  [1,4,7],
  # middle column
  [2,5,8],
  # right column
  [0,4,8],
  # tl to dr diagonal
  [2,4,6],
  # tr to dl diagonal
  ]


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])
      return win_combination
    end 
  end
  return false
end

def full?(board)
  board.none? { |position| position == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
 end
return false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  return false
end

def winner(board)
  winning_array = won?(board)
  if winning_array
    winning_location = winning_array[0]
    board[winning_location]
  end
end