% Define a graph represented as edges
edge(a, b).
edge(b, c).
edge(c, d).
edge(d, e).
edge(b, f).
edge(f, g).

% Depth-first search predicate
dfs(Node, Goal) :-
    dfs_helper(Node, Goal, []).

% Helper predicate with a stack to keep track of visited nodes
dfs_helper(Node, Goal, _) :-
    Node == Goal,
    write('Goal reached: '), write(Goal), nl.

dfs_helper(Node, Goal, Visited) :-
    \+ member(Node, Visited), % Check if Node is not in Visited
    write('Visiting node: '), write(Node), nl,
    asserta(visited(Node)), % Assert that Node has been visited
    edge(Node, NextNode), % Get the next adjacent node

    dfs_helper(NextNode, Goal, [Node | Visited]). % Recursive call with updated visited nodes

% Example usage:
% To find a path from 'a' to 'g', use dfs(a, g).
