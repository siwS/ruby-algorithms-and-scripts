AVAILABLE_DIRECTIONS = ["N", "E", "S", "W"]

puts "X=#{ARGV[0]} Y=#{ARGV[1]} direction=#{ARGV[2]} commands=#{ARGV[3]} grid_size=#{ARGV[4]}"

x = ARGV[0].to_i
y = ARGV[1].to_i

grid_size = ARGV[4].to_i

# (N,S,E,W)
direction = ARGV[2]

# forward/backward (f,b)
# left/right (l,r)
commands = ARGV[3]

def move_x(x, direction, command)
  return x if ["N", "S"].include? direction
  return x if ["l", "r"].include? command

  if direction == "E"
    increment_north_east(x, command)
  elsif direction == "W"
    increment_south_west(x, command)
  end
end

def move_y(y, direction, command)
  return y if ["W", "E"].include? direction
  return y if ["l", "r"].include? command

  if direction == "N"
    increment_north_east(y, command)
  elsif direction == "S"
    increment_south_west(y, command)
  end
end

def increment_north_east(position, command)
  if command == "f"
    position + 1
  elsif command == "b"
    position - 1
  end
end

def increment_south_west(position, command)
  if command == "f"
    position - 1
  elsif command == "b"
    position + 1
  end
end

def change_direction(direction, command)
  return direction unless ["l", "r"].include? command
  current_direction_index = AVAILABLE_DIRECTIONS.index(direction)

  if command == "r"
    if current_direction_index == AVAILABLE_DIRECTIONS.count - 1
      AVAILABLE_DIRECTIONS[0]
    else
      AVAILABLE_DIRECTIONS[current_direction_index + 1]
    end
  elsif command == "l"
    AVAILABLE_DIRECTIONS[current_direction_index - 1]
  end
end

def adjust_to_grid_size(position, grid_size)
  if position == grid_size + 1
    -grid_size
  elsif position == -grid_size - 1
    grid_size
  else
    position
  end
end

commands.chars.each do |command|
  x         = move_x(x, direction, command)
  x         = adjust_to_grid_size(x, grid_size)
  y         = move_y(y, direction, command)
  y         = adjust_to_grid_size(y, grid_size)
  direction = change_direction(direction, command)

  puts "Final state: #{x} #{y} #{direction}"
end

