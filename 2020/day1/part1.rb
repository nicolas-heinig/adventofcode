numbers = File.readlines('day1/input.txt').map { _1.strip.to_i }

result = numbers.permutation(2).find { |numbers| numbers.sum == 2020 }

pp result
pp result.reduce(&:*)
