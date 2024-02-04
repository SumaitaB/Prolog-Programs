
distances([
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]).

random_permutation([], []).
random_permutation(List, [Elem|Perm]) :-
    select(Elem, List, Rest),
    random_permutation(Rest, Perm).

total_distance(Tour, Distance) :-
    distances(Distances),
    tour_distance(Tour, Distances, Distance).

tour_distance([], _, 0).
tour_distance([City1, City2|Rest], Distances, Distance) :-
    nth0(Index1, Distances, Row),
    nth0(Index2, Row, Distance1),
    tour_distance([City2|Rest], Distances, Distance2),
    Distance is Distance1 + Distance2.


select_parents(Population, Parents) :-
    select(Parent1, Population, RestPopulation1),
    select(Parent2, RestPopulation1, Parents).

crossover(Parent1, Parent2, Child1, Child2) :-
    length(Parent1, Length),
    random_between(1, Length, Start),
    random_between(Start, Length, End),
    crossover_segment(Parent1, Parent2, Start, End, Child1),
    crossover_segment(Parent2, Parent1, Start, End, Child2).

crossover_segment(Parent1, Parent2, Start, End, Child) :-
    length(Child, Length),
    segment_from_parent(Parent1, Start, End, Segment),
    append(Segment, RestParent2, Parent2),
    append(RestParent2, Segment, FullChild),
    fill_gaps(FullChild, Parent1, RestParent1),
    append(RestParent1, Child, Parent1).

segment_from_parent(Parent, Start, End, Segment) :-
    length(Parent, Length),
    Start1 is Start - 1,
    End1 is End - 1,
    findall(X, (between(1, Length, I), I >= Start, I =< End, nth1(I, Parent, X)), Segment).

fill_gaps(FullChild, Parent, RestParent) :-
    findall(X, (member(X, Parent), \+ member(X, FullChild)), RestParent).

% Mutation (Swap Mutation)
mutation(Tour, MutatedTour) :-
    length(Tour, Length),
    random_between(1, Length, Index1),
    random_between(1, Length, Index2),
    swap(Tour, Index1, Index2, MutatedTour).

swap(List, Index1, Index2, SwappedList) :-
    nth1(Index1, List, Elem1),
    nth1(Index2, List, Elem2),
    replace(List, Index1, Elem2, TempList),
    replace(TempList, Index2, Elem1, SwappedList).

replace([_|T], 1, X, [X|T]).
replace([H|T], I, X, [H|R]) :-
    I > 1,
    I1 is I - 1,
    replace(T, I1, X, R).


initial_population(Size, Population) :-
    distances(Distances),
    length(Distances, NumCities),
    findall(Tour, (between(1, Size, _), random_permutation([1,2,3,4], Tour)), Population).

evaluate_population([], []).
evaluate_population([Tour|Rest], [(Tour, Distance)|RestEvaluated]) :-
    total_distance(Tour, Distance),
    evaluate_population(Rest, RestEvaluated).

evolve_population([], _, []).
evolve_population([Parent1, Parent2|Rest], MutationRate, [Child1, Child2|RestChildren]) :-
    crossover(Parent1, Parent2, Child1, Child2),
    (maybe_mutate(Child1, MutationRate, MutatedChild1) ; MutatedChild1 = Child1),
    (maybe_mutate(Child2, MutationRate, MutatedChild2) ; MutatedChild2 = Child2),
    evolve_population(Rest, MutationRate, RestChildren).

maybe_mutate(Tour, MutationRate, MutatedTour) :-
    maybe(MutationRate),
    mutation(Tour, MutatedTour).

maybe(Probability) :-
    random(100, Random),
    Random < Probability.

% Main function to solve TSP using Genetic Algorithm
tsp_ga(Size, Generations, MutationRate, BestTour) :-
    initial_population(Size, Population),
    tsp_ga_loop(Generations, Population, MutationRate, BestTour).

tsp_ga_loop(0, [BestTour|_], _, BestTour).
tsp_ga_loop(Generations, Population, MutationRate, BestTour) :-
    evaluate_population(Population, EvaluatedPopulation),
    keysort(EvaluatedPopulation, SortedPopulation),
    pairs_values(SortedPopulation, SortedTours),
    select_parents(SortedTours, Parents),
    evolve_population(Parents, MutationRate, Children),
    append(SortedTours, Children, NewPopulation),
    NextGenerations is Generations - 1,
    tsp_ga_loop(NextGenerations, NewPopulation, MutationRate, BestTour).

