require './directions'

class MarsRover
  attr_reader :direction, :position

  def initialize(initial_direction, initial_position=[0,0])
    @direction = initial_direction
    @position = initial_position
  end

  def turn_left
    @direction = @direction.turn_left
  end

  def turn_right
    @direction = @direction.turn_right
  end

  def move
    @position = @direction.move(@position)
  end

  def to_string
    "#{position[0]} #{position[1]} #{direction.to_string}"
  end
end
