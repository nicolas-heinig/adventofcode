instructions = File.readlines('day12/input.txt').map do |line|
  command = line.scan(/\D/).first
  length = line.scan(/\d+/).first.to_i
  [command, length]
end

pos = {
  north: 0,
  east: 0,
  facing: :east
}

waypoint = {
  north: 1,
}

directions = %i[north east south west] * 2

instructions.each do |command, length|
  case command
  when 'N'
    pos[:north] += length
  when 'S'
    pos[:north] -= length
  when 'E'
    pos[:east] += length
  when 'W'
    pos[:east] -= length
  when 'L'
    pos[:facing] = directions[directions.index(pos[:facing]) - (length / 90)]
  when 'R'
    pos[:facing] = directions[directions.index(pos[:facing]) + (length / 90)]
  when 'F'
    pos[:north] += length if pos[:facing] == :north
    pos[:north] -= length if pos[:facing] == :south
    pos[:east] += length if pos[:facing] == :east
    pos[:east] -= length if pos[:facing] == :west
  else
    puts 'UNKNOWN:', command
  end
end

puts pos[:north].abs + pos[:east].abs
