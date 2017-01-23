require './directions.rb'
require './pilot.rb'
require './rover.rb'
plateau = ARGF.gets

while !ARGF.eof
  rover_info = ARGF.gets
  rover_position = rover_info.split[0,2]
  rover_direction = rover_info.split[2]
  direction = Directions.give_direction_object(rover_direction)
  rover_obj = MarsRover.new(direction, rover_position)
  Pilot.new(rover_obj).receive ARGF.gets

  puts rover_obj.to_string

end
