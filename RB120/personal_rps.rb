class Player
  attr_accessor :move

  def initialize(player_type)
    @player_type = player_type
    @move = nil
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper or scissors"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "Please enter a valid choice"
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to rock paper and scissors game"
  end

  def display_goodbye_message
    puts "Thanks for playing rock paper and scissors game"
  end

  def display_winner
    puts "You choose #{human.move}"
    puts "The computer choose #{computer.move}"

    if player_win?
      puts "You are the winner"
    elsif computer_win?
      puts "Computer win"
    else
      puts "It's a tie"
    end
  end

  def player_win?
    return true if human.move == 'rock' && computer.move == 'scissors'
    return true if human.move == 'scissors' && computer.move == 'paper'
    return true if human.move == 'paper' && computer.move == 'rock'
    false
  end

  def computer_win?
    return true if computer.move == 'rock' && human.move == 'scissors'
    return true if computer.move == 'scissors' && human.move == 'paper'
    return true if computer.move == 'paper' && human.move == 'rock'
    false
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end

RPSGame.new.play
