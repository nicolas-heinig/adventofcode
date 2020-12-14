adapters = File.readlines('day10/input.txt').map { _1.to_i }
adapters += [adapters.max + 3] + [0]

dp = Hash.new do |hash, key|
  range = (key - 3...key)
  possible_adapters = range.filter { |i| adapters.include? i }
  sum = possible_adapters.map { |i| hash[i] }.sum
  hash[key] = sum
end

dp[0] = 1
puts dp[adapters.max + 3]
