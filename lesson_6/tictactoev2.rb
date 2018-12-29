require 'pry'
require 'io/console'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals
WINNER_SCORE = 5

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def computer_ai(brd,marker)
  square = nil
  WINNING_LINES.each do |line|
   if brd.values_at(*line).count(marker) == 2
    line.map { |num| square = num if brd[num] == ' ' }
   end
   break if square
  end
  square
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil
  square = computer_ai(brd,COMPUTER_MARKER) if !square
  square = computer_ai(brd,PLAYER_MARKER) if !square
  square = 5 if brd[5] == ' '
  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_score_board(winner, score_board)
  score_board[winner] = score_board[winner] + 1
end

def display_score_board(score_board)
  puts "\nS C O R E  B O A R D"
  puts "===================="
  score_board.map do |key, val|
    puts " #{key.to_s.ljust(9)} :  #{val}"
  end
  puts "===================="
end

def continue_game
  print "\nPress any key to continue."
  STDIN.getch
  print ''
end

def clear_screen
  system('clear') || system('cls')
end

#### LET THE GAME BEGIN! ####
score_board = { Player: 0, Computer: 0 }

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    update_score_board(winner.to_sym, score_board)
    prompt "#{winner} won!"
  else
    prompt "It's a tie!"
  end

  display_score_board(score_board)

  break if score_board.value?(WINNER_SCORE)
  continue_game
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
