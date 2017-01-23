module Directions
  def self.give_direction_object(direction)
    case direction
      when "N" then NORTH
      when "S" then SOUTH
      when "E" then EAST
      when "W" then WEST
      else
        puts "The Direction entered is incorrect. Please enter E W N S"
    end
  end

  class North
    def turn_left
      WEST
    end
    def turn_right
      EAST
    end
    def move(current_position)
      x = Integer(current_position[0])
      y = Integer(current_position[1]) + 1
      [x, y]
    end
    def to_string
      "N"
    end
  end

  class West
    def turn_left
      SOUTH
    end
    def turn_right
      NORTH
    end
    def move(current_position)
      x = Integer(current_position[0]) - 1
      y = Integer(current_position[1])
      [x, y]
    end
    def to_string
      "W"
    end
  end

  class East
    def turn_left
      NORTH
    end
    def turn_right
      SOUTH
    end
    def move(current_position)
      x = Integer(current_position[0]) + 1
      y = Integer(current_position[1])
      [x, y]
    end
    def to_string
      "E"
    end
  end

  class South
    def turn_left
      EAST
    end
    def turn_right
      WEST
    end
    def move(current_position)
      x = Integer(current_position[0])
      y = Integer(current_position[1]) - 1
      [x, y]
    end
    def to_string
      "S"
    end
  end

  NORTH = North.new
  WEST = West.new
  SOUTH = South.new
  EAST = East.new
end
