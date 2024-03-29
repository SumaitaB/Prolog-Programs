%connected(+Start, +Goal, -Weight)
connected(1,7,1).
connected(1,8,1).
connected(1,3,1).
connected(7,4,1).
connected(7,20,1).
connected(7,17,1).
connected(8,6,1).
connected(3,9,1).
connected(3,12,1).
connected(9,19,1).
connected(4,42,1).
connected(20,28,1).
connected(17,10,1).

connected2(X,Y,D) :- connected(X,Y,D).
connected2(X,Y,D) :- connected(Y,X,D).

next_node(Current, Next, Path) :-
    connected2(Current, Next, _),
    not(member(Next, Path)).

depth_first(Goal, Goal, _, [Goal]).
depth_first(Start, Goal, Visited, [Start|Path]) :-
    next_node(Start, Next_node, Visited),
    write(Visited), nl,
    depth_first(Next_node, Goal, [Next_node|Visited], Path).

breadth_first(Goal, Goal, _,[Goal]).
breadth_first(Start, Goal, Visited, Path) :-
    findall(X,
            (connected2(X,Start,_),not(member(X,Visited))),
            [T|Extend]),
    write(Visited), nl,
    append(Visited, [T|Extend], Visited2),
    append(Path, [T|Extend], [Next|Path2]),
    breadth_first(Next, Goal, Visited2, Path2).
