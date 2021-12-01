# input = File.readlines('day13/input.txt')
input = File.readlines('day13/input.txt')

buses = input[1].split(',').map(&:to_i).reject(&:zero?)

remainders = input[1].split(',').map.with_index do |bus, pos|
  next nil if bus == 'x'

  bus.to_i - (pos % bus.to_i)
end.compact

product = buses.reduce(:*)

multiples = buses.map do |num|
  base = product / num
  multiplier = (1..).find { |n| (n * base) % num == 1 }
  multiplier * base
end

r = multiples.map.with_index { |m, i| m * remainders[i] }.sum % product

pp r
