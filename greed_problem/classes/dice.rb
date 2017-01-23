class Dice
  def roll(number_of_dice)
    @dice_values = number_of_dice.times.map {rand(6) + 1}
  end
  def dice_values
    @dice_values
  end
end