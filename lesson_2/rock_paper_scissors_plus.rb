require 'io/console'

VALID_CHOICES = {
  r: 'rock', p: 'paper', sc: 'scissors', l: 'lizard', sp: 'spock'
}

WINNING_CHOICES = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['scissors', 'rock'],
  lizard: ['paper', 'spock']
}

MAX_SCORE = 5

def display_welcome
  animate("Welcome to the game of Rock, Paper, Scissors, Lizard, Spock!")
  animate("This is a multi-round game. The match is over when either of")
  animate("you or the computer reaches 5 WINS.")
  animate("The winning player becomes the GRAND WINNER!!!")
end

def continue_game
  print "\nPress any key to continue."
  STDIN.getch
  print ''
end

def clear_screen
  system('clear') || system('cls')
end

def display_choices
  VALID_CHOICES.map do |key, val|
    puts "#{key.to_s.ljust(2)} - #{val}"
  end
end

def win?(first, second)
  first = first.to_sym
  WINNING_CHOICES.key?(first) && WINNING_CHOICES[first].include?(second)
end

def pick_winner(player, computer)
  if win?(player, computer)
    'player'
  elsif win?(computer, player)
    'computer'
  else
    'tie'
  end
end

def update_score_board(winner, score_board)
  score_board[winner] = score_board[winner] + 1
end

def display_results(winner)
  case winner
  when 'player' then animate("You won!\n")
  when 'computer' then animate("Computer won!\n")
  else animate("\nIt's a tie!\n")
  end
end

def display_score_board(score_board)
  puts "\nS C O R E  B O A R D"
  puts "===================="
  score_board.map do |key, val|
    puts " #{key.to_s.ljust(9)} :  #{val}"
  end
  puts "===================="
end

def display_grand_winner(score_board)
  winner = score_board.key(MAX_SCORE).to_s
  if winner == 'player'
    animate("Congratulations, You are the GRAND WINNER!!!\n\n")
  else
    animate("Computer is the GRAND WINNER!!!\n\n")
  end
end

def animate(string)
  print "\n"
  string.each_char do |char|
    print char
    wait_time = rand(0.02..0.05)
    sleep(wait_time)
  end
end

# LET THE GAME BEGIN!
clear_screen
display_welcome

score_board = { player: 0, computer: 0 }

loop do # main loop
  choice = ''
  loop do
    continue_game
    clear_screen
    puts "\nChoose one:"
    display_choices
    choice = gets.chomp.downcase.to_sym

    if VALID_CHOICES.key?(choice)
      break
    else
      puts "That's not a valid choice."
    end
  end

  clear_screen
  player_choice = VALID_CHOICES[choice]
  computer_choice = VALID_CHOICES.values.sample
  puts("You chose: #{player_choice}; Computer chose: #{computer_choice}")

  winner = pick_winner(player_choice, computer_choice)
  display_results(winner)

  update_score_board(winner.to_sym, score_board) unless winner == 'tie'
  display_score_board(score_board)

  break if score_board.value?(MAX_SCORE)
end # end of main loop

display_grand_winner(score_board)
