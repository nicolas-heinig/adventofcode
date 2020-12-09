numbers = File.readlines('day9/input.txt').map(&:to_i)

invalid_number = 14144619
step_size = 1
result = nil

while result.nil? do
  numbers.each.with_index do |number, index|
    next if index < step_size

    previous = numbers[index - step_size .. index]

    if previous.sum == invalid_number
      result = [previous.min, previous.max].sum
    end
  end

  step_size += 1
end

puts result
