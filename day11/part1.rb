def seat_at(seats, row, col)
  max_row = seats.length - 1
  max_col = seats.first.length - 1

  return if row.negative?
  return if col.negative?
  return if row > max_row
  return if col > max_col

  seats[row][col]
end

def fill(seats)
  result = Array.new(seats.length) { Array.new(seats.first.size) }

  seats.each_with_index do |row, row_index|
    row.each_with_index do |seat, col_index|
      adjacent = [
        seat_at(seats, row_index, col_index - 1),
        seat_at(seats, row_index, col_index + 1),
        seat_at(seats, row_index - 1, col_index - 1),
        seat_at(seats, row_index - 1, col_index),
        seat_at(seats, row_index - 1, col_index + 1),
        seat_at(seats, row_index + 1, col_index - 1),
        seat_at(seats, row_index + 1, col_index),
        seat_at(seats, row_index + 1, col_index + 1)
      ].compact

      occupied_adjacent = adjacent.count('#')

      if seat == '.'
        result[row_index][col_index] = '.'
      elsif seat == 'L' && occupied_adjacent == 0
        result[row_index][col_index] = '#'
      elsif seat == '#' && occupied_adjacent >= 4
        result[row_index][col_index] = 'L'
      else
        result[row_index][col_index] = seat
      end
    end
  end

  [result, seats]
end

previous = nil
current = File.readlines('day11/input.txt').map { _1.strip.split('') }

until previous == current
  current, previous = fill current
end

puts current.join.count('#')