input = File.readlines('day5/input.txt').map { _1.strip }

to_binary = {
  'F' => '0',
  'B' => '1',
  'L' => '0',
  'R' => '1'
}

seats = input.each_with_object [] do |code, seats|
  row = code[0..6].gsub(/\w/, to_binary).to_i 2
  column = code[7..-1].gsub(/\w/, to_binary).to_i 2

  seats << 8 * row + column
end

neighbours = seats.sort.each_cons(2).find { (_2 - _1) > 1 }

pp neighbours.first + 1
