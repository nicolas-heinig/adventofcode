adapters = File.readlines('day10/input.txt').map { _1.to_i }

adapters.push 0, adapters.max + 3

diffs = adapters.sort.each_cons(2).map { |x, y| y - x }
counts = diffs.tally

puts counts[1] * counts[3]
