commands = File.readlines('day8/input.txt').map { _1.strip.split ' ' }

accumulator = 0
current = 0
executed = []

until executed.include? current
  operation, arg = commands[current]

  puts "Running operation #{operation} #{arg}"

  executed << current

  case operation
  when 'acc'
    accumulator += arg.to_i
    current += 1
  when 'jmp'
    current += arg.to_i
  when 'nop'
    current += 1
  end
end

pp accumulator