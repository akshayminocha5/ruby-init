class Pilot
  def initialize(mars_rover)
    @mars_rover = mars_rover
  end

  def receive(command_line)
    command_line.each_char do |command|
      case
        when command == 'L'
          @mars_rover.turn_left
        when command == 'R'
          @mars_rover.turn_right
        when command == 'M'
          @mars_rover.move
      end
    end
  end
end
