from collections import deque

def valid(state, new_queen):
    for col, row in enumerate(state):
          if abs(row - new_queen) == abs(col - len(state)) or\
          new_queen in state:
              return False        
    return True

size = 8
count=0
queue = deque((queen_pos,) for queen_pos in range(size))
print(queue)
while queue:
    board_state = queue.popleft()
    print(board_state)
    if len(board_state) == size:
        count+=1
        print('solution:', board_state)
        print('Count:', count)
        continue
    for queen_pos in range(size):
        if not valid(board_state, queen_pos):
            continue
        next_state = board_state + (queen_pos,)
        queue.append(next_state)
