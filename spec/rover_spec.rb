require '../rover'

describe Rover do
  it 'will let you create a new rover with any given co-ordinates and direction.' do
    rover = Rover.new(1, 2, 'N')
    expect(rover.x_coordinate).to eq 1
    expect(rover.y_coordinate).to eq 2
    expect(rover.cardinal_direction).to eq 'N'
  end

  context 'Describes the Rover in North facing' do
    it "should move the rover 1 position towards the direction if input is 'M' and direction is 'N'." do
      rover = Rover.new(4, 1, 'N')
      rover.rover_controller('M')
      expect(rover.y_coordinate).to eq 2
    end

    it 'will stop the Rover from falling off surface plateau' do
      rover = Rover.new(1, 3, 'N')
      10.times do
        rover.rover_controller('M')
      end
      expect(rover.y_coordinate).to eq Rover::PLATEAU_BORDERS[1]
    end
  end

  context 'Describe for when the Rover is turning left' do
    it 'will turn the Rover West when in the North facing direction' do
      rover = Rover.new(3, 3, 'N')
      rover.rover_controller('L')
      expect(rover.direction_to_move).to eq 'W'
    end

    it 'will turn the Rover North when in the East facing direction' do
      rover = Rover.new(3, 3, 'E')
      rover.rover_controller('L')
      expect(rover.direction_to_move).to eq 'N'
    end

    it 'will turn the Rover East when in the South facing' do
      rover = Rover.new(3, 3, 'S')
      rover.rover_controller('L')
      expect(rover.direction_to_move).to eq 'E'
    end

    it 'will turn the Rover South when in the West facing' do
      rover = Rover.new(3, 3, 'W')
      rover.rover_controller('L')
      expect(rover.direction_to_move).to eq 'S'
    end
  end

  context 'Describes the Rover is turning right' do
    it 'will turn East when in the North facing direction' do
      rover = Rover.new(3, 3, 'N')
      rover.rover_controller('R')
      expect(rover.direction_to_move).to eq 'E'
    end

    it 'will turn South in the East facing direction' do
      rover = Rover.new(3, 3, 'E')
      rover.rover_controller('R')
      expect(rover.direction_to_move).to eq 'S'
    end

    it 'will turn West when in the South facing direction' do
      rover = Rover.new(3, 3, 'S')
      rover.rover_controller('R')
      expect(rover.direction_to_move).to eq 'W'
    end

    it 'will turn North when in the West facing direction' do
      rover = Rover.new(3, 3, 'W')
      rover.rover_controller('R')
      expect(rover.direction_to_move).to eq 'N'
    end
  end

end

