require 'set'

def priority(set)
  total = 0
  for char in set
    val = char.ord - 96  # 'a' = 97 - 96 = 1
    if val < 0  # must've been uppercase
      val += 58  # difference between the two character set
    end
    total += val
  end
  total
end

def halves(str)
  return [str[0, str.length/2], str[str.length/2..-1]]
end

def part1(filename)
  total = 0
  for line in File.open(filename)
    first, second = halves(line.strip)
    comp_1 = Set.new(first.chars)
    comp_2 = Set.new(second.chars)
    intersection = comp_1 & comp_2
    total += priority(intersection)
  end
  total
end

def part2(filename)
  file = File.open(filename)
  lines = file.readlines()
  total = 0
  (0..lines.length).step(3) do |idx|
    if idx+3 > lines.length
      break
    end
    first = lines[idx].strip!
    second = lines[idx+1].strip!
    third = lines[idx+2].strip!
    s1 = Set.new(first.chars)
    s2 = Set.new(second.chars)
    s3 = Set.new(third.chars)
    intersection = s1 & s2 & s3
    total += priority(intersection)
  end
  total
end


def main()
  filename = ARGV[0]

  puts part1(filename)
  puts part2(filename)
end

main()
