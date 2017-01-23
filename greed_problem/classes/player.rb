require './modules/score.rb'

class Player
  include Score
  attr_reader :score
  attr_reader :last_score

  WINNING_SCORE = 3000
  ROUND_CONTINUE_SCORE = 300

  def initialize
    @score = 0
    @last_score = 0
    @dice_set = Dice.new
  end

  def new_turn
    @last_score = 0
  end

  def reset_score
    @score = 0
  end

  def reach_winning_score?
    @score >= WINNING_SCORE
  end

  def continue_game?
    @last_score >= ROUND_CONTINUE_SCORE
  end

  def roll(num_dice)
    @dice_set.roll(num_dice)
    @dice_set.dice_values
  end

  def get_score(dice_values)
    total = calculate_score(dice_values)
    @last_score += total
    @score += total
    total
  end

  def has_non_scoring?
    num_non_scoring > 0
  end

  def count_non_scoring
    num_non_scoring
  end

  def loose_round
    @score -= @last_score
    @last_score = 0
  end

end
