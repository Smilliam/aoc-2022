class Assignment
  attr_reader :start, :last, :str

  def initialize(range_str)
    @str = range_str
    split = range_str.split('-')
    @start = split[0].to_i
    @last = split[1].to_i
  end

  def contains(other)
    if self.start <= other.start and self.last >= other.last
      return true
    end

    return false
  end

  def overlaps(other)
    if self.start >= other.last or other.start <= self.last
      return true
    end

    return false
  end
end

def main()
  filename = ARGV[0]

  containment_count = 0
  overlap_count = 0
  File.open(filename).each do |line|
    line.chomp!
    ranges = line.split(',')
    first = Assignment.new(ranges[0])
    second = Assignment.new(ranges[1])
    if first.contains(second) or second.contains(first)
      containment_count += 1
    end
    if first.overlaps(second) and second.overlaps(first)
      overlap_count += 1
    end
  end

  puts containment_count
  puts overlap_count
end

main()
