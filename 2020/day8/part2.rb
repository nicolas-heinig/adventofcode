def run(commands)
  accumulator = 0
  current = 0
  executed = []

  loop do
    return accumulator, false if executed.include? current
    return accumulator, true if commands[current].nil?

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
end

commands = File.readlines('day8/input.txt').map { _1.strip.split ' ' }

commands.each_with_index do |(operation, arg), index|
  new_instruction = case operation
  when 'jmp'
    ['nop', arg]
  when 'nop'
    ['jmp', arg]
  else
    next
  end

  new_commands = commands.clone
  new_commands[index] = new_instruction

  accumulator, success = run new_commands

  if success
    puts accumulator
    return
  end
end
