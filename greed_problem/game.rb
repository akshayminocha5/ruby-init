require './classes/player.rb'
require './classes/dice.rb'
require './modules/score.rb'

class Game
  EXIT_GAME = 0

  def initialize
    @players = []
  end

  def ask_for_num_players
    puts "How many players in the game?"
    n = Integer(gets.chop)

    unless n > 1
      puts "2 or more players required."
      ask_for_num_players
    end
    n.times { @players << Player.new}
  end

  def start
    puts "Welcome! Lets the games begin"
    ask_for_num_players
    launch
  end

  def finish_turn?(n_player)
    n_player == @players.size
  end

  def finish_game?
    ret = false
    @players.each do |player|
      ret = player.reach_winning_score?
    end
    ret
  end

  def play(player, dice = 5)
    dice_values = player.roll(dice)
    puts "Dice valus are -"
    print dice_values
    print "\n"
    total = player.get_score(dice_values)
    puts "Total Score in this dice roll is : #{total}"
    if total == 0
      puts "You loose #{player.last_score} points."
      player.loose_round
      puts "Total Score is #{player.score}"
    elsif player.has_non_scoring?
      puts "This round #{player.last_score}, and total #{player.score}"
      puts "Do you want to continue turn with non scoring dice? (Y/N)"
      option = gets.chop
      if option == "Y"
        play(player, player.count_non_scoring)
      end
    end
  end

  def launch
    n = 0
    values = []
    while true
      player = @players[n]
      puts "Player #{n+1}: press 1 to roll, 0 to quit"
      input = Integer(gets.chop)
      break if input == EXIT_GAME

      player.new_turn
      play(player)

      if !player.continue_game?
        player.reset_score
      end

      break if finish_game?
      n = n.next
      (n = 0) if finish_turn?(n)
    end
    play_last_turn if finish_game?
    exit
  end

  def print_winner
    max = 0
    index = 0
    @players.each do |player|
      if player.score > max
        max = player.score
        index = @players.index(player)
      end
    end
    puts "Winner is Player #{index+1}"
  end

  def play_last_turn
    i = 1
    @players.each do |player|
      puts "Player #{i+1} rolling..."
      play(player)
    end

    print_winner
  end

  def exit_game
    puts "Thanks for playing!"
  end
end

game = Game.new
game.start
