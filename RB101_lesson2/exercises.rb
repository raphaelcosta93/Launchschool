VALID_CHOICES = %w[rock paper scissors lizard spock].freeze

WINNING_PLAYER = 3

WIN_HAND = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  lizard: ['spock', 'paper'],
  spock: ['rock', 'paper']
}.freeze

def player_win(player, computer)
  WIN_HAND[player.to_sym].include?(computer)
end

def computer_win(computer, player)
  WIN_HAND[computer.to_sym].include?(player)
end

def prompt(message)
  puts "=> #{message}"
end

def display_choices
  puts <<-MSG
  =>Please chose one option below by typing the whole world or the shortcut!
  Rock (r);
  Paper(p);
  Scissors(sc);
  Lizard(l);
  Spock(sp)
  MSG
end

def converter(choice)
  case choice
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 'sc' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
  end
end

def convert_if_shortcut(input)
  if input.length <= 2
    converter(input)
  else
    input
  end
end

def display_result(player_wins , computer_wins)
  prompt("The final score is Player -> #{player_wins} and Computer - > #{computer_wins}")
end

def current_score(player, computer)
  prompt("Current score is Player -> #{player} and Computer -> #{computer}")
end

def game_over(player_total_wins, computer_total_wins)
  player_total_wins == WINNING_PLAYER || computer_total_wins == WINNING_PLAYER
end

def display_champ(player)
  prompt("Game is over!")
  if player == 3
    prompt("Player you are the CHAMPION!!!")
  else
    prompt("Computer is the champion.")
  end
end
     
prompt("Welcome to the Rock, Paper, Scissors, Lizard and Spock game!")
loop do # main loop
  player_wins = 0
  computer_wins = 0
loop do #current game loop 
  choice = nil
loop do #player input validation loop
  prompt(display_choices)
  choice = gets.chomp.downcase
    choice = convert_if_shortcut(choice)
    
  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("This choice is not valid!!! Please enter a valid choice")
  end
end

  computer_choice = VALID_CHOICES.sample
 
prompt("Player chose -> #{choice}, computer chose -> #{computer_choice}")

  if player_win(choice,computer_choice)
    player_wins += 1
    prompt("You won this round")
  elsif computer_win(computer_choice,choice)
    computer_wins += 1
    prompt("Computer won this round")
  else
    prompt("it's a tie")
  end

if game_over(player_wins,computer_wins)
  break
else
  current_score(player_wins, computer_wins)
 end
end


  display_result(player_wins, computer_wins)
  display_champ(player_wins)

prompt("Would you like to play again?")
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')
end

prompt("Thanks for playing the game!")
