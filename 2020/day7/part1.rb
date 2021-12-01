def bags_for_color(bags, color)
  bags.each_with_object([]) do|(bag, rules), colors|
    rules.reject(&:nil?).each do |rule|
      if rule == color
        colors << bag
        colors.concat bags_for_color(bags, bag)
      end
    end
  end
end

input = File.readlines('day7/input.txt')

bags = input.each_with_object({}) do |line, mem|
  bag = line[/(^\w+\s\w+)\sbags/, 1]
  rules = line.split("contain")[1].split(',').map(&:strip)

  mem[bag] = rules.map do |rule|
    next if rule.include?("no other bags")

    rule[/(\w+\s\w+)\sbag/, 1]
  end
end

pp bags_for_color(bags,"shiny gold").uniq.length
