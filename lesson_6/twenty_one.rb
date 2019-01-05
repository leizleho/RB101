SUITS = ['H', 'D', 'C', 'S']
FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
MAX_CARD_VALUE = 21
DEALER_HIT_STOP = 17

def initialize_deck
  SUITS.product(FACES).shuffle
end

def get_value(cards)
  values = cards.map { |card| card[1] }
  total = 0

  values.each do |val|
    total += if val.to_i > 0
               val.to_i
             elsif ['J', 'K', 'Q'].include?(val)
               10
             elsif val == 'A'
               total + 11 <= MAX_CARD_VALUE ? 11 : 1
             end
  end

  total
end

def busted?(cards)
  get_value(cards) > MAX_CARD_VALUE
end

def get_winner(dealer_cards, player_cards)
  player_value = get_value(player_cards)
  dealer_value = get_value(dealer_cards)

  if player_value > MAX_CARD_VALUE
    'player_busted'
  elsif dealer_value > MAX_CARD_VALUE
    'dealer_busted'
  elsif player_value > dealer_value
    'player'
  elsif player_value < dealer_value
    'dealer'
  else
    'tie'
  end
end

def display_winner(dealer_cards, player_cards)
  winner = get_winner(dealer_cards, player_cards)

  case winner
  when 'player_busted'
    puts "You busted! Dealer wins!"
  when 'dealer_busted'
    puts "Dealer busted! You win!"
  when 'player'
    puts "You win!"
  when 'dealer'
    puts "Dealer wins!"
  when 'tie'
    puts "It's a tie!"
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def player_turn(cards, deck)
  puts "\nYour turn.."
  loop do
    answer = nil
    loop do
      puts "\nhit or stay?"
      answer = gets.chomp.downcase
      break if ['h', 'hit', 's', 'stay'].include?(answer)
      puts "Invalid answer!"
    end

    if ['h', 'hit'].include?(answer)
      cards << deck.shift
      puts "You chose to hit!"
      puts "Your cards are now: #{cards}"
      puts "Your total is now: #{get_value(cards)}"
    end

    break if ['s', 'stay'].include?(answer) || busted?(cards)
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def dealer_turn(cards, deck)
  loop do
    break if get_value(cards) >= DEALER_HIT_STOP
    puts "\nDealer hits.."
    cards << deck.shift
    puts "Dealer cards are now: #{cards}"
    puts "Dealer cards total value is now: #{get_value(cards)}"
  end
end

def play_again?
  puts "Do you want to play again? y/n"
  answer = gets.chomp.downcase
  answer.start_with?('y')
end

# Game start here
loop do
  system('clear') || system('cls')
  deck = initialize_deck

  player_cards = []
  dealer_cards = []

  2.times do
    player_cards << deck.shift
    dealer_cards << deck.shift
  end

  # Display initial cards
  puts "Dealer has #{dealer_cards[0]} and ?"
  puts "You have: #{player_cards[0]} and #{player_cards[1]}"
  puts "You hava a total value of #{get_value(player_cards)}."

  # player's turn
  player_turn(player_cards, deck)
  if busted?(player_cards)
    display_winner(dealer_cards, player_cards)
    play_again? ? next : break
  else
    puts "You stayed at #{get_value(player_cards)}\n"
  end

  # dealer's turn
  dealer_turn(dealer_cards, deck)
  if busted?(dealer_cards)
    display_winner(dealer_cards, player_cards)
    play_again? ? next : break
  end

  # both player and dealer stays - compare cards!
  puts "\nDealer has #{dealer_cards}"
  puts "Dealer cards is: #{get_value(dealer_cards)}"
  puts "\nYou have #{player_cards}"
  puts "You have a total of: #{get_value(player_cards)}"

  display_winner(dealer_cards, player_cards)

  break unless play_again?
end

puts "Thank you for playing Twenty-One! Good bye!"
