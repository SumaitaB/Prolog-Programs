% Base case: Sum of an empty list is 0.
sum_list([], 0).

% Recursive case: Sum of a list is the sum of its head and the sum of its tail.
sum_list([Head | Tail], Sum) :-
    sum_list(Tail, TailSum),
    Sum is Head + TailSum.

% Base case: Length of an empty list is 0.
length_list([], 0).

% Recursive case: Length of a list is 1 plus the length of its tail.
length_list([_ | Tail], Length) :-
    length_list(Tail, TailLength),
    Length is 1 + TailLength.

% Base case: Max of a single-element list is the element itself.
max_list([X], X).

% Recursive case: Max of a list is the maximum of its head and the max of its tail.
max_list([Head | Tail], Max) :-
    max_list(Tail, TailMax),
    Max is max(Head, TailMax).
