TARGET = 21
DEALER_LIMIT = 17

SUITS = ['H', 'D', 'C', 'S']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack',
          'Queen', 'King', 'Ace']

rules = <<-MSG
+------------------------------+ The rules are simple! +-------------------------------------+
|  The goal of '21' is to beat the dealer's hand without going over 21.                      |
|  Face cards are worth 10. Aces are worth 1 or 11, whichever makes a better hand.           |
|  Each player starts with two cards, one of the dealer's cards is hidden until the end.     |
|  To 'Hit' is to ask for another card. To 'Stay' is to hold your total and end your turn.   |
|  If you go over 21 you bust, and the dealer wins regardless of the dealer's hand.          |
|  Dealer will hit until his/her cards total 17 or higher.                                   |
+-----------------------------+ Press any key to continue +----------------------------------+
MSG

def prompt(msg)
  puts "=> #{msg}"
end

def initiliaze_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"

      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(cards)
  total(cards) > TARGET
end

def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)
  if player_total > TARGET
    prompt("Player busted dealer wins")
  elsif dealer_total > TARGET
    prompt("Dealer busted player wins")
  elsif dealer_total < player_total
    prompt("Player wins")
  elsif dealer_total > player_total
    prompt("Dealer wins")
  else
    prompt("Tie")
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end
loop do
  system 'clear'
  prompt(" Welcome to Twenty-One") # welcome prompt
  puts rules # rules explanation
  start_game = gets.chomp
  # initialize deck
  deck = initiliaze_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  player_cards = deck.pop(2)
  dealer_cards = deck.pop(2)
  prompt("Your cards are #{player_cards} for #{total(player_cards)} points")
  prompt("Dealer has #{dealer_cards[0]}")

  player_turn = nil
  loop do # player turn
    loop do
      prompt("Would you like to hit or stay ?")
      player_turn = gets.chomp.downcase
      break if ['hit', 'stay'].include?(player_turn)
      prompt("You must enter a valid input, 'hit' or 'stay'")
    end

    if player_turn == 'hit'
      player_cards << deck.pop
      prompt("You chose to hit !")
      prompt("Your cards are #{player_cards} for #{total(player_cards)} points")
      prompt("Dealer has #{dealer_cards[0]}")
    end

    break if player_turn == 'stay' || busted?(player_cards)
  end

  if busted?(player_cards)
    prompt("You busted at #{total(player_cards)} points")
    prompt("Dealer Won")
    play_again? ? next : break
  elsif player_turn == 'stay'
    prompt("You stayed at #{total(player_cards)} points")
  end

  prompt("Dealer Turn")
  prompt("Dealer cards are now: #{dealer_cards}")
  prompt("total #{total(dealer_cards)} points")

  loop do
    break if total(dealer_cards) >= DEALER_LIMIT
    prompt("Dealer Hits")
    dealer_cards << deck.pop
    prompt("Dealer cards are now: {#{dealer_cards}")
    prompt("total #{total(dealer_cards)} points")
  end

  if busted?(dealer_cards)
    prompt("Dealer busted at #{total(dealer_cards)} points")
    prompt("Player Won")
  else
    prompt("Dealer stays at #{total(dealer_cards)} points")
  end

  detect_result(dealer_cards, player_cards)
  break unless play_again?
end
