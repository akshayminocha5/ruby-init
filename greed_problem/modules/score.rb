module Score
  ALL_DICE_UNIQUE = [1, 2, 3, 4, 5, 6]
  def calculate_score(dice_values)
    return 0 if dice_values.empty?

    points = 0
    @num_scoring_dice = 0
    @non_scoring_dice = dice_values.sort
    ALL_DICE_UNIQUE.each do |n|
      total = @non_scoring_dice.count(n)
      next if total == 0
    if total >= 3 # can check for three
      points += n == 1? 1000 : 100 * n
      3.times { @non_scoring_dice.shift }
      @num_scoring_dice += 3
    end
    total = @non_scoring_dice.count(n)
      if n == 5
        points += total * 50
      elsif n == 1
        points += total * 100
      end

      if n == 5 || n == 1
        @num_scoring_dice += total
        @non_scoring_dice.delete(n)
      end
    end

    @num_non_scoring = dice_values.length - @num_scoring_dice
    points
  end

  def num_non_scoring
    @num_non_scoring
  end
end