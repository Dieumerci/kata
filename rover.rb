class Rover
  attr_accessor :x_coordinate, :y_coordinate, :cardinal_direction
  PLATEAU_BORDERS = [8, 8].freeze

  def initialize(x_coordinate, y_coordinate, cardinal_direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @cardinal_direction = cardinal_direction
  end


  def rover_controller(input_control_rover)
    input_commands_array = input_control_rover.split('')
    input_commands_array.each do |input_commands|
      case input_commands
        when 'M'
          direction_to_move
        when 'L' || 'R'
          rover_orientation input_commands
      end
    end
  end


  def direction_to_move
    case @cardinal_direction
    when 'N'
      @y_coordinate += 1
    when 'W'
      @x_coordinate -= 1
    when 'S'
      @y_coordinate -= 1
    when 'E'
      @x_coordinate += 1
    end
  end

  def rover_orientation(direction_input)
    if direction_input == 'L'
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

  def display_cardinal_coordinates
    puts "#{@x_coordinate} #{@y_coordinate} #{@cardinal_direction}"
  end
end

rover = Rover.new(1, 2, 'N')
rover.rover_controller('LMLMLMLMM')
rover.display_cardinal_coordinates
