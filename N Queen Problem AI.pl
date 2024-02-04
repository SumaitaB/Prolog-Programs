% Place queens on the board
% queens(N, Queens) - Queens is a solution to the N-Queens problem
queens(N, Queens) :-
    numlist(1, N, Columns),     % Generate a list of columns from 1 to N
    permutation(Columns, Queens),  % Permute the columns to get a solution

    % Check if the solution is safe
    safe(Queens).

% Helper predicate to check if the solution is safe
safe([]).
safe([Column|Queens]) :-
    safe(Queens, Column, 1),
    safe(Queens).

safe([], _, _).
safe([OtherColumn|OtherQueens], Column, RowDiff) :-
    Column =\= OtherColumn,
    abs(Column - OtherColumn) =\= RowDiff,
    NewRowDiff is RowDiff + 1,
    safe(OtherQueens, Column, NewRowDiff).

% Example queries:
% To find a solution for the 8-Queens problem, you can use:
% ?- queens(8, Queens).
%
% To find all solutions for the 4-Queens problem, you can use:
% ?- queens(4, Queens).
