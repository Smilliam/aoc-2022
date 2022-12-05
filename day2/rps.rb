$shape_map = {"A" => 1, "B" => 2, "C" => 3, "X" => 1, "Y" => 2, "Z" => 3}
$win_map = {"X" => "C", "Y" => "A", "Z" => "B"}
$lose_map = {"A" => "Z", "B" => "X", "C" => "Y"}
$inverse_win_map = {"A" => "Y", "B" => "Z", "C" => "X"}

def get_score_with_outcome(op_move, outcome)
  case outcome
  when "X"
    return get_score(op_move, $lose_map[op_move])
  when "Y"
    return get_score(op_move, op_move)
  when "Z"
    return get_score(op_move, $inverse_win_map[op_move])
  else
    "uhhhhhhh"
  end
end

def get_score(op_move, pl_move)
  if $win_map[pl_move] == op_move
    return 6 + $shape_map[pl_move]
  elsif $lose_map[op_move] == pl_move
    return 0 + $shape_map[pl_move]
  else
    return 3 + $shape_map[pl_move]
  end
end

def main()
  filename = "input.txt"
  file = File.open(filename)

  total = 0
  for line in file
    split = line.split()
    total += get_score(split[0], split[1])
  end

  puts total

  file.close()
  file = File.open(filename)
  total = 0
  for line in file
    split = line.split()
    total += get_score_with_outcome(split[0], split[1])
  end

  puts total
end

main()
