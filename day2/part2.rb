input = File.readlines('day2/input.txt').map { _1.split(':').map &:strip }

valid, invalid = input.partition do |policy, password|
  positions, letter = policy.split ' '
  pos1, pos2 = positions.split('-').map { _1.to_i - 1 }

  letters = password.split ''
  letters.values_at(pos1, pos2).join.count(letter) == 1
end

pp valid.count
