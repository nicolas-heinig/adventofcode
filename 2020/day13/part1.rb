input = File.readlines('day13/input.txt')

earliest = input.first.to_i
buses = input[1].split(',').map(&:to_i).reject(&:zero?)

available = nil

departure = (earliest..).find do |time|
  available = buses.find { |bus| time % bus == 0 }
  !available.nil?
end

pp (departure - earliest) * available
