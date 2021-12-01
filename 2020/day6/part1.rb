groups = File.read('day6/input.txt').split("\n\n").map { _1.split "\n" }

answers = groups.map do |group|
  first, *rest = group.map { _1.split '' }
  first.union(*rest).size
end.sum

pp answers
