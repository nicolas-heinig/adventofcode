input = File.readlines('day2/input.txt').map { _1.split(':').map &:strip }

valid, invalid = input.partition do |policy, password|
  minmax, letter = policy.split ' '
  min, max = minmax.split('-').map &:to_i

  count = password.count letter
  (min..max).include? count
end

pp valid.count
