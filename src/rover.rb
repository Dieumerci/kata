class Rover
  # The four cardinal directions are the directions north, east, south, and west
  attr_accessor :x_coordinate, :y_coordinate, :cardinal_direction

  def initialize(x_coordinate, y_coordinate, cardinal_direction, plateau)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @cardinal_direction = cardinal_direction
    @plateau = plateau
  end

  def rover_controller(input_commands_to_control_rover)
    input_commands_array = input_commands_to_control_rover.split('')
    input_commands_array.each do |input_commands|
      case input_commands
        when 'M'
          direction_to_move
        when 'L' || 'R'
          make_rover_spin input_commands
      end
    end
  end

  def direction_to_move

  end

  def make_rover_spin(direction)
    if direction == 'L'
      case @cardinal_direction
      when 'N'
        @cardinal_direction = 'W'
      when 'W'
        @cardinal_direction = 'S'
      when 'S'
        @cardinal_direction = 'E'
      when 'E'
        @cardinal_direction = 'N'
      end
    else
      case @cardinal_direction
      when 'N'
        @cardinal_direction = 'E'
      when 'W'
        @cardinal_direction = 'N'
      when 'S'
        @cardinal_direction = 'W'
      when 'E'
        @cardinal_direction = 'S'
      end
    end
  end


end
