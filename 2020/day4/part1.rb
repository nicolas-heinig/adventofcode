lines = File.readlines('day4/input.txt')

passports = []
current_passport = {}

lines.each do |line|
  unless line == "\n"
    stripped = line.strip
    fields = stripped.split(' ').map { _1.split ':' }
    fields.each { current_passport.store *_1 }
  else
    passports << current_passport
    current_passport = {}
  end
end

required_fields = %w[
  byr
  iyr
  eyr
  hgt
  hcl
  ecl
  pid
]

res = passports.count do |passport|
  (required_fields - passport.keys).empty?
end

pp res
