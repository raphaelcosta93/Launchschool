class Participant
  attr_accessor :hand

  def add_card(new_card)
    hand << new_card
  end

  def initialize
    @hand = []
  end
end

class Player < Participant
end

class Dealer < Participant
end

class Deck
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack',
            'Queen', 'King', 'Ace']

  attr_accessor :deck

  def initialize
    @deck = []
    0.upto(SUITS.size - 1).each do |idx_suits|
      0.upto(VALUES.size - 1).each do |idx_values|
        @deck << [SUITS[idx_suits], VALUES[idx_values]]
      end
    end
    deck.shuffle!
  end

  def deal_one
    deck.pop
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def rules
    <<-MSG
+------------------------------+ The rules are simple! +-------------------------------------+
|  The goal of 'Blackjack' is to beat the dealer's hand without going over 21.                      |
|  Face cards are worth 10. Aces are worth 1 or 11, whichever makes a better hand.           |
|  Each player starts with two cards, one of the dealer's cards is hidden until the end.     |
|  To 'Hit' is to ask for another card. To 'Stay' is to hold your total and end your turn.   |
|  If you go over 21 you bust, and the dealer wins regardless of the dealer's hand.          |
|  Dealer will hit until his/her cards total 17 or higher.                                   |
+-----------------------------+ Press any key to continue +----------------------------------+
MSG
  end

  def start
    clear
    display_welcome_message
    puts rules
    start_game = gets.chomp
    deal_cards
    show_cards
    loop do
      player_turn
      break if busted?(player, 21)
      dealer_turn
      break
    end
    if busted?(player, 21) || busted?(dealer, 21)
      display_goodbye_message
    else
      show_result
    end
  end

  private

  def show_result
    puts "Dealer points are #{total_points(dealer.hand)} and player points are #{total_points(player.hand)}"
    if total_points(player.hand) > total_points(dealer.hand)
      puts "It looks like Player wins!"
    elsif total_points(dealer.hand) > total_points(player.hand)
      puts "It looks like Dealer wins!"
    else
      puts "It's a tie!"
    end
  end

  def busted?(player_type, points)
    total_points(player_type.hand) > points
  end

  def dealer_turn
    loop do
      if total_points(dealer.hand) >= 17 && total_points(dealer.hand) <= 21
        puts "Dealer stays"
        break
      else
        puts "Dealer hits"
        dealer.add_card(deck.deal_one)
        if busted?(dealer, 21)
          puts "Dealer busted player won"
          break
        end
      end
    end
  end

  def player_turn
    answer = nil

    loop do
      loop do
        puts "Would you like to hit or stay ?"
        answer = gets.chomp.downcase

        break if %w(hit stay).include?(answer)
        puts "You must enter a valid input, 'hit' or 'stay'"
      end

      if answer == 'hit'
        player.add_card(deck.deal_one)
        show_cards
        if busted?(player, 21)
          puts "Player busted Dealer won"
          break
        end
      else
        puts "Player stays!"
        break
      end
    end
  end

  def clear
    system 'clear'
  end

  def total_points(hand)
    values = hand.map { |card| card[1] }

    sum = 0
    values.each do |value|
      if value == "Ace"
        sum += 11
      elsif value.to_i == 0 # J, Q, K
        sum += 10
      else
        sum += value.to_i
      end
    end

    values.select { |value| value == "A" }.count.times do
      sum -= 10 if sum > 21
    end
    sum
  end

  def show_cards
    puts "Player cards are #{player.hand}, for a total of #{total_points(player.hand)} points"
    puts "Dealer has #{dealer.hand[0]}"
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def display_welcome_message
    puts "Welcome to the Blackjack game!"
  end

  def display_goodbye_message
    puts "Thanks for playing the Blackjack game. Goodbye!"
  end
end

game = Game.new
game.start
