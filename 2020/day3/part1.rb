map = File.readlines('day3/input.txt').map { _1.strip.split '' }

hstep = 3
hpos = 0
trees = 0

map.each do |row|
  expanded = row

  until expanded[hpos] != nil
    expanded += row
  end

  trees += 1 if expanded[hpos] == '#'

  hpos += hstep
end

pp trees
