map = File.readlines('day3/input.txt').map { _1.strip.split '' }

def traverse(map, hstep, vstep)
  hpos = 0
  trees = 0

  map.each_with_index do |row, i|
    next unless i % vstep == 0

    expanded = row

    until expanded[hpos] != nil
      expanded += row
    end

    trees += 1 if expanded[hpos] == '#'

    hpos += hstep
  end

  trees
end

res = [
  traverse(map, 1, 1),
  traverse(map, 3, 1),
  traverse(map, 5, 1),
  traverse(map, 7, 1),
  traverse(map, 1, 2)
].reduce(&:*)

pp res
