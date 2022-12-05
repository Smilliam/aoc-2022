def create_stacks(file)
  rows = Array.new
  while (line = file.readline()) != "\n"
    rows.push(line.chomp!)
  end

  stack_map = Hash.new
  column_legend = rows.pop

  for row in rows
    column_legend.each_char.with_index do |val, idx|
      if val != " " and row[idx] != " "
        if stack_map.has_key?(val)
          stack_map[val].unshift(row[idx])
        else
          stack_map[val] = [row[idx]]
        end
      end
    end
  end

  stack_map.default = []
  stack_map
end

def run_moves_part1(stacks, file)
  for line in file
    /move (?<move>\d+) from (?<from>\d+) to (?<to>\d+)/ =~ line.chomp!
    from_stack = stacks[from]
    to_stack = stacks[to]
    move = move.to_i
    while move > 0
      to_stack.push(from_stack.pop)
      move -= 1
    end
  end
end

def run_moves_part2(stacks, file)
  for line in file
    /move (?<move>\d+) from (?<from>\d+) to (?<to>\d+)/ =~ line.chomp!
    from_stack = stacks[from]
    to_stack = stacks[to]
    move = move.to_i
    to_stack.push(*from_stack.slice!(-move..-1))
  end
end

def main()
  filename = ARGV[0]

  file = File.open(filename)

  stacks = create_stacks(file)

  run_moves_part1(stacks, file)
  str = ""
  for val in 1..stacks.size
    str += stacks[val.to_s][-1]
  end
  puts str

  file.rewind

  stacks = create_stacks(file)
  run_moves_part2(stacks, file)
  str = ""
  for val in 1..stacks.size
    str += stacks[val.to_s][-1]
  end
  puts str
end

main()
