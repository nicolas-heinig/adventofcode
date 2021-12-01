groups = File.read('day6/input.txt').split("\n\n").map { _1.split "\n" }

answers = groups.map do |group|
  people = group.map { _1.split '' }
  people.inject(:&).size
end.sum

pp answers
