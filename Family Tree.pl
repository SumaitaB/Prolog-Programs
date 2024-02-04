male(shorifuddin).
male(arabi).
male(shamsudddin).
male(abdussalam).

female(omaina).
female(sumaita).
female(pyara).
female(rani).

parent(arabi, shorifuddin).
parent(arabi, omaina).

parent(sumaita, shorifuddin).
parent(sumaita, omaina).

parent(shorifuddin, shamsuddin).
parent(shorifuddin, rani).

parent(omaina, abdussalam).
parent(omaina, pyara).


father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

brother(Brother, Person) :-
    male(Brother),
    sibling(Brother, Person).

sister(Sister, Person) :-
    female(Sister),
    sibling(Sister, Person).

grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

grandmother(Grandmother, Grandchild) :-
    mother(Grandmother, Parent),
    parent(Parent, Grandchild).

grandfather(Grandfather, Grandchild) :-
    father(Grandfather, Parent),
    parent(Parent, Grandchild).
