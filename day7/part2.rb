def total_for_color(bags, color)
  total = 1
  bags[color].each do |rule|
    if rule != {}
      total + rule[:quantity] * total_for_color(bags, rule[:color])
    end
  end
  total
end

input = File.readlines('day7/input.txt')

bags = input.each_with_object({}) do |line, mem|
  bag = line[/(^\w+\s\w+)\sbags/, 1]
  rules = line.split("contain")[1].split(',').map(&:strip)

  mem[bag] = rules.map do |rule|
    next {} if rule.include?("no other bags")

    {
      quantity: rule[/^\d+/].to_i,
      color: rule[/(\w+\s\w+)\sbag/, 1]
    }
  end
end

pp total_for_color(bags,"shiny gold") - 1
