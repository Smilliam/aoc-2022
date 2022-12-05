def part1(ff):
    max_cal = 0
    cur_cal = 0
    while line := ff.readline():
        if line == '\n':
            if cur_cal > max_cal:
                max_cal = cur_cal
            cur_cal = 0
        else:
            cur_cal += int(line)

    print(max_cal)

def part2(ff):
    import heapq
    max_three = []
    cur_cal = 0
    while line := ff.readline():
        if line == '\n':
            heapq.heappush(max_three, cur_cal)
            heapq.heapify(max_three)
            while len(max_three) > 3:
                heapq.heappop(max_three)
            
            cur_cal = 0
        else:
            cur_cal += int(line)

    print(sum(max_three))


if __name__ == '__main__':
    with open('day1.txt', 'r') as ff:
        part1(ff)
    
    with open('day1.txt', 'r') as ff:
        part2(ff)
