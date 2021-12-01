numbers = File.readlines('day9/input.txt').map(&:to_i)

pre_size = 25

result = numbers.find.with_index do |number, index|
  next if index < pre_size

  previous = numbers[index - pre_size, pre_size]
  sums = previous.permutation(2).map(&:sum)
  !sums.include? number
end

puts result
