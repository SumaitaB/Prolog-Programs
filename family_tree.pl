male(rahim).
female(rahima).

male(karim).
female(neela).
male(kuddus).


female(marjina).
female(riya).
male(biplop).
female(rita).
male(rayhan).
female(meena).

parent_of(rahim,neela).

parent_of(rahim,karim).

parent_of(rahim, kuddus).

parent_of(karim, morjina).
parent_of(karim,riya).

parent_of(neela, biplop).
parent_of(neela, rita).

parent_of(kuddus, ryhan).
parent_of(kussdus, meena).


/* Rules */
father_of(X,Y):- male(X),parent_of(X,Y).

mother_of(X,Y):- female(X),parent_of(X,Y).

grandfather_of(X,Y):- male(X),
    parent_of(X,Z),
    parent_of(Z,Y).

grandmother_of(X,Y):- female(X),
    parent_of(X,Z),
    parent_of(Z,Y).

sister_of(X,Y):-female(X),
    father_of(F, Y), father_of(F,X),X \= Y.

sister_of(X,Y):- female(X),
    mother_of(M, Y), mother_of(M,X),X \= Y.


brother_of(X,Y):- %(X,Y or Y,X)%
    male(X),
    father_of(F, Y), father_of(F,X),X \= Y.

brother_of(X,Y):- male(X),
    mother_of(M, Y), mother_of(M,X),X \= Y.

aunt_of(X,Y):- female(X),
    parent_of(Z,Y), sister_of(Z,X),!.

uncle_of(X,Y):-
    parent_of(Z,Y), brother_of(Z,X).
