require 'set'

def main()
  filename = ARGV[0]
  n = ARGV[1].to_i

  line = File.open(filename).readline.chomp!

  for i in 0..line.size
    if i < n
      next
    end
    char_set = line[(i-n)..(i-1)].chars.to_set
    if char_set.size == n
      puts i
      break
    end
  end
end

main()
