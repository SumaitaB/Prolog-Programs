use_module(library(lists)).

n_queen(N, Solution) :-

	length(Solution, N),

	queen(Solution, N).



up2N(N,N,[N]) :-!.
up2N(K,N,[K|Tail]) :- K < N, K1 is K+1, up2N(K1, N, Tail).


queen([],_).

queen([Q|Qlist],N) :-

	queen(Qlist, N),


	up2N(1,N,Candidate_positions_for_queenQ),


	member(Q, Candidate_positions_for_queenQ),


	check_solution(Q,Qlist, 1).



check_solution(_,[], _).

check_solution(Q,[Q1|Qlist],Xdist) :-
	Q =\= Q1,
	Test is abs(Q1-Q),
	Test =\= Xdist,
	Xdist1 is Xdist + 1,
	check_solution(Q,Qlist,Xdist1).
