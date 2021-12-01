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

rules = {
  'byr' => ->(v) { v.to_i.between? 1920, 2002 },
  'iyr' => ->(v) { v.to_i.between? 2010, 2020 },
  'eyr' => ->(v) { v.to_i.between? 2020, 2030 },
  'hgt' => lambda do |v|
    v.end_with?('cm') ? v.to_i.between?(150, 193) : v.to_i.between?(59, 76)
  end,
  'hcl' => ->(v) { v.match? /\A#([0-9a-f]){6}\Z/ },
  'ecl' => ->(v) { %w(amb blu brn gry grn hzl oth).include? v },
  'pid' => ->(v) { v.match? /\A\d{9}\Z/ },
  'cid' => ->(_) { true }
}

res = passports.count do |passport|
  next unless (required_fields - passport.keys).empty?

  passport.all? { |field, value| rules.fetch(field).call value }
end

pp res
